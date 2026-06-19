#!/usr/bin/env python3
"""Build a ChatGPT-friendly project snapshot zip.

The snapshot is intentionally built from an allowlist instead of archiving the
repository tree. It converts the useful Typst guide content to Markdown and keeps
canonical TOML data alongside notes, research, and plant images.
"""

from __future__ import annotations

import datetime as dt
import argparse
import re
import shutil
import tempfile
import zipfile
from dataclasses import dataclass
from pathlib import Path

try:
    import tomllib
except ModuleNotFoundError:  # Python < 3.11
    from pip._vendor import tomli as tomllib


ROOT = Path(__file__).resolve().parents[1]
DIST = ROOT / "dist"
ZIP_PATH = DIST / "plant-guide-chatgpt-snapshot.zip"
SNAPSHOT_DIR = "plant-guide-chatgpt"

# TODO(phase 10): Consider a future refactor where Markdown/knowledge files become
# the canonical knowledge layer and Typst becomes a publishing layer. Do not do that
# in this snapshot builder revision.

TOPIC_SOURCES = {
    "soil": ROOT / "content" / "soil.typ",
    "fertilizer": ROOT / "content" / "fertilizer.typ",
    "products": ROOT / "content" / "products.typ",
    "watering": ROOT / "content" / "watering.typ",
    "weed_control": ROOT / "content" / "weed_control.typ",
    "wildlife": ROOT / "content" / "wildlife.typ",
    "task_grid": ROOT / "content" / "task_grid.typ",
    "checklist": ROOT / "content" / "checklist.typ",
}

GROUP_ORDER = ("trees", "evergreens", "shrubs", "lawn", "perennials", "grasses", "potted")
GROUP_LABELS = {
    "trees": "Trees",
    "evergreens": "Evergreens",
    "shrubs": "Shrubs",
    "lawn": "Lawn",
    "perennials": "Perennials",
    "grasses": "Ornamental Grasses",
    "potted": "Potted Plants",
}

MONTHS = ("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
BANNED_ZIP_PARTS = (".git/", "__MACOSX/", ".DS_Store")
DECISION_DOCS = (
    ROOT / "docs" / "front_rose_planter_redo.md",
    ROOT / "docs" / "other_planter_planting_concepts.md",
)
EXTRA_TOPIC_DOCS = {
    "lawn_reel_guide": ROOT / "docs" / "lawn_reel_guide.md",
}
DECISION_TERMS = ("planter", "redo", "concept", "shopping", "purchase")


@dataclass
class SnapshotStats:
    plants_converted: int = 0
    topics_converted: int = 0
    notes_copied: int = 0
    decisions_copied: int = 0
    research_copied: int = 0
    images_copied: int = 0
    images_included: bool = False
    files_included: int = 0
    zip_size_bytes: int = 0


def load_toml(path: Path) -> dict:
    return tomllib.loads(path.read_text(encoding="utf-8"))


def load_plants() -> list[dict]:
    return load_toml(ROOT / "data" / "plants.toml")["plants"]


def plant_map(plants: list[dict]) -> dict[str, dict]:
    return {plant["file"]: plant for plant in plants}


def snapshot_refs() -> dict[str, str]:
    soil = load_toml(ROOT / "data" / "soil.toml")
    lawn = load_toml(ROOT / "data" / "lawn_program.toml")["lawn_program"]
    inventory = load_toml(ROOT / "data" / "inventory.toml")
    preen = next((item for item in inventory["items"] if item.get("id") == "preen_bed_preemergent"), {})
    return {
        "#soil-ph": str(soil["soil"]["ph"]),
        "#lawn-size-sqft": str(lawn["lawn_sqft"]),
        "#lawn-n-range-display": f'{lawn["annual_n_min"]}-{lawn["annual_n_max"]}',
        "#preen-inventory-qty": str(preen.get("quantity", "")),
        "#preen-inventory-unit": str(preen.get("unit", "")),
        "#preen-status": str(preen.get("status", "")),
        "#preen-season-lock": str(preen.get("season_lock", "")),
        "#preen-scope": str(preen.get("scope", "")),
    }


def rel_md_link(path: str, label: str | None = None) -> str:
    return f"[{label or path}]({path})"


def md_table(headers: list[str], rows: list[list[str]]) -> str:
    def cell(value: object) -> str:
        text = str(value).replace("\n", "<br>").replace("|", "\\|").strip()
        return text or " "

    lines = [
        "| " + " | ".join(cell(header) for header in headers) + " |",
        "| " + " | ".join("---" for _ in headers) + " |",
    ]
    for row in rows:
        padded = row + [""] * (len(headers) - len(row))
        lines.append("| " + " | ".join(cell(value) for value in padded[: len(headers)]) + " |")
    return "\n".join(lines)


def strip_typst_comments(text: str) -> str:
    return "\n".join(line for line in text.splitlines() if not line.lstrip().startswith("//"))


def replace_typst_text_wrappers(text: str) -> str:
    pattern = re.compile(r"#text(?:\([^][]*\))?\[([^][]*)\]")
    previous = None
    while previous != text:
        previous = text
        text = pattern.sub(r"\1", text)
    return text


def convert_inline(text: str, refs: dict[str, str] | None = None) -> str:
    refs = refs or {}
    text = text.replace("\\~", "~")
    for key, value in refs.items():
        text = text.replace(key, value)
    text = re.sub(r'#link\("([^"]+)"\)\[([^\]]+)\]', r"[\2](\1)", text)
    text = replace_typst_text_wrappers(text)
    text = re.sub(r"#([A-Za-z0-9_-]+)", r"\1", text)
    text = text.replace(" \\ ", "<br>")
    text = text.replace("\\\n", "<br>\n")
    text = text.replace("\\", "")
    text = re.sub(r"[ \t]+", " ", text)
    return text.strip()


def convert_heading(line: str, plant_page: bool = False) -> str | None:
    match = re.match(r"^(=+)\s+(.*)$", line)
    if not match:
        return None
    level = len(match.group(1))
    if plant_page:
        level = max(2, level - 1)
    return f"{'#' * level} {convert_inline(match.group(2))}"


def read_balanced(lines: list[str], start: int, open_char: str, close_char: str) -> tuple[str, int]:
    block_lines: list[str] = []
    depth = 0
    square_depth = 0
    in_string = False
    escaped = False
    started = False

    for index in range(start, len(lines)):
        line = lines[index]
        block_lines.append(line)
        for char in line:
            if square_depth > 0:
                if char == "[":
                    square_depth += 1
                elif char == "]":
                    square_depth -= 1
                continue
            if in_string:
                if escaped:
                    escaped = False
                elif char == "\\":
                    escaped = True
                elif char == '"':
                    in_string = False
                continue
            if char == '"':
                in_string = True
                continue
            if char == "[":
                square_depth += 1
                continue
            if char == open_char:
                depth += 1
                started = True
            elif char == close_char and started:
                depth -= 1
                if depth == 0:
                    return "\n".join(block_lines), index + 1
    raise ValueError(f"Unclosed block starting at line {start + 1}")


def parse_bracket_content(text: str, start: int) -> tuple[str, int]:
    if text[start] != "[":
        raise ValueError("parse_bracket_content must start at '['")
    depth = 0
    content: list[str] = []

    for index in range(start, len(text)):
        char = text[index]
        if char == "[":
            if depth > 0:
                content.append(char)
            depth += 1
            continue
        if char == "]":
            depth -= 1
            if depth == 0:
                return "".join(content), index + 1
            content.append(char)
            continue
        if depth > 0:
            content.append(char)
    raise ValueError("Unclosed square bracket block")


def top_level_square_blocks(text: str, start: int = 0) -> list[str]:
    blocks: list[str] = []
    index = start
    while index < len(text):
        if text[index] == "[":
            block, index = parse_bracket_content(text, index)
            blocks.append(block)
            continue
        index += 1
    return blocks


def render_callout(kind: str, title: str, body: str, refs: dict[str, str]) -> str:
    labels = {"warning": "Warning", "info": "Note", "danger": "Important"}
    label = labels[kind]
    converted = convert_typst_markdown(body, refs=refs)
    quote_lines = [f"> **{label}: {convert_inline(title, refs)}**"]
    for line in converted.splitlines():
        quote_lines.append(f"> {line}" if line else ">")
    return "\n".join(quote_lines)


def render_toml_soil_table(refs: dict[str, str]) -> str:
    soil = load_toml(ROOT / "data" / "soil.toml")
    rows = [
        [row["parameter"], row.get("status_text", ""), row["management"]]
        for row in soil["rows"]
    ]
    return md_table(["Parameter", "Status", "Management"], rows)


def render_emitter_table(plants: list[dict]) -> str:
    rows = [
        [plant["name"], plant["emitter_display"], plant["emitter_note"]]
        for plant in plants
        if plant.get("irrigation") == "drip"
    ]
    return md_table(["Plant", "Emitters", "Notes"], rows)


def render_fertilizer_table(plants: list[dict]) -> str:
    rows = [[plant["name"], plant["fertilizer_program"]] for plant in plants]
    return md_table(["Plant", "Fertilizer Program"], rows)


def render_typst_table(block: str, refs: dict[str, str]) -> str:
    headers = [convert_inline(header, refs) for header in re.findall(r"tbl-header-text\[([^]]+)\]", block)]
    if not headers:
        return ""

    last_header = 0
    for match in re.finditer(r"tbl-header-text\[[^]]+\]", block):
        last_header = match.end()

    cells = [convert_inline(cell, refs) for cell in top_level_square_blocks(block, last_header)]
    width = len(headers)
    rows = [cells[index : index + width] for index in range(0, len(cells), width)]
    return md_table(headers, rows)


def extract_field(block: str, name: str, refs: dict[str, str]) -> str | None:
    match = re.search(rf"\b{name}:\s*\[", block)
    if not match:
        return None
    content, _ = parse_bracket_content(block, match.end() - 1)
    return convert_inline(content, refs)


def render_product_entry(block: str, refs: dict[str, str]) -> str:
    name_match = re.search(r'#pe\("([^"]+)"', block)
    if not name_match:
        return ""
    name = name_match.group(1)
    fields = [
        ("Role", extract_field(block, "role", refs)),
        ("NPK", extract_field(block, "npk", refs)),
        ("Apply to", extract_field(block, "apply", refs)),
        ("When", extract_field(block, "timing", refs)),
        ("Note", extract_field(block, "note", refs)),
        ("Sources", extract_field(block, "sources", refs)),
    ]

    lines = [f"#### {name}"]
    for label, value in fields:
        if value:
            lines.append(f"- **{label}:** {value}")
    return "\n".join(lines)


def should_skip_line(line: str) -> bool:
    stripped = line.strip()
    return (
        not stripped
        or stripped.startswith("#import")
        or stripped.startswith("#pagebreak")
        or stripped.startswith("#v(")
    )


def convert_typst_markdown(
    text: str,
    refs: dict[str, str] | None = None,
    plants: list[dict] | None = None,
    plant_page: bool = False,
) -> str:
    refs = refs or snapshot_refs()
    plants = plants or load_plants()
    text = strip_typst_comments(text)
    text = text.replace("#soil-profile-table", render_toml_soil_table(refs))
    text = text.replace("#emitter-config-table", render_emitter_table(plants))
    text = text.replace("#fertilizer-program-table", render_fertilizer_table(plants))
    lines = text.splitlines()
    output: list[str] = []
    index = 0

    while index < len(lines):
        line = lines[index]
        stripped = line.strip()

        if should_skip_line(line):
            index += 1
            if output and output[-1] != "":
                output.append("")
            continue

        if stripped.startswith("#let "):
            if "={" in stripped.replace(" ", "") or stripped.endswith("{"):
                _, index = read_balanced(lines, index, "{", "}")
            else:
                index += 1
            continue

        if stripped.startswith("#{"):
            _, index = read_balanced(lines, index, "{", "}")
            continue

        callout = re.match(r'#(warning|info|danger)-callout\("([^"]+)"\)\[', stripped)
        if callout:
            body_lines: list[str] = []
            index += 1
            while index < len(lines) and lines[index].strip() != "]":
                body_lines.append(lines[index])
                index += 1
            index += 1
            output.append(render_callout(callout.group(1), callout.group(2), "\n".join(body_lines), refs))
            output.append("")
            continue

        if stripped.startswith("#pe("):
            block, index = read_balanced(lines, index, "(", ")")
            rendered = render_product_entry(block, refs)
            if rendered:
                output.append(rendered)
                output.append("")
            continue

        if stripped.startswith("#table("):
            block, index = read_balanced(lines, index, "(", ")")
            rendered = render_typst_table(block, refs)
            if rendered:
                output.append(rendered)
                output.append("")
            continue

        heading = convert_heading(stripped, plant_page=plant_page)
        if heading:
            if output and output[-1] != "":
                output.append("")
            output.append(heading)
            output.append("")
            index += 1
            continue

        converted = convert_inline(line, refs)
        if converted:
            output.append(converted)
        elif output and output[-1] != "":
            output.append("")
        index += 1

    return normalize_markdown("\n".join(output))


def normalize_markdown(text: str) -> str:
    lines = [line.rstrip() for line in text.splitlines()]
    normalized: list[str] = []
    blank_count = 0
    for line in lines:
        if line:
            normalized.append(line)
            blank_count = 0
        else:
            blank_count += 1
            if blank_count <= 1:
                normalized.append("")
    return "\n".join(normalized).strip() + "\n"


def parse_plant_header(text: str) -> tuple[str, str, str, str, str]:
    match = re.search(
        r'#plant-header\("([^"]+)",\s*"([^"]+)",\s*"([^"]+)".*?\)\[',
        text,
        flags=re.DOTALL,
    )
    if not match:
        raise ValueError("Missing plant-header")
    body, end = parse_bracket_content(text, match.end() - 1)
    return match.group(1), match.group(2), match.group(3), body, text[end:]


def render_plant_page(
    path: Path,
    plant: dict,
    refs: dict[str, str],
    plants: list[dict],
    include_images: bool,
) -> str:
    title, latin, image_key, intro, remainder = parse_plant_header(path.read_text(encoding="utf-8"))
    image_name = f"{image_key}.jpg"
    image_path = ROOT / "images" / image_name
    metadata = [
        ("Latin name", latin),
        ("Group", GROUP_LABELS.get(plant.get("group", ""), plant.get("group", ""))),
        ("Irrigation", plant.get("irrigation", "")),
        ("Established", plant.get("established", "")),
        ("Lifespan", plant.get("lifespan", "")),
        ("Maintenance tier", plant.get("maintenance_tier", "")),
        ("Primary failure mode", plant.get("primary_failure_mode", "")),
        ("Sun", plant.get("sun", "")),
    ]

    lines = [f"# {title}", ""]
    if include_images and image_path.exists():
        lines.append(f"Image: {rel_md_link(f'../images/{image_name}', image_name)}")
        lines.append("")
    for label, value in metadata:
        if value != "":
            lines.append(f"- **{label}:** {value}")
    if plant.get("notes"):
        lines.append(f"- **Data note:** {plant['notes']}")
    lines.append("")
    intro_md = convert_typst_markdown(intro, refs=refs, plants=plants, plant_page=True)
    if intro_md.strip():
        lines.append(intro_md.strip())
        lines.append("")
    lines.append(convert_typst_markdown(remainder, refs=refs, plants=plants, plant_page=True).strip())
    return normalize_markdown("\n".join(lines))


def render_task_grid(path: Path, refs: dict[str, str]) -> str:
    text = path.read_text(encoding="utf-8")
    before = text.split("#let Y = true", 1)[0]
    intro = convert_typst_markdown(before, refs=refs)
    rows: list[list[str]] = []
    category = ""
    in_grid = False
    for raw in text.splitlines():
        line = raw.strip()
        if line.startswith("#let grid-data"):
            in_grid = True
            continue
        if not in_grid:
            continue
        if line == ")":
            break
        cat_match = re.match(r'"([^"]+)",$', line)
        if cat_match:
            category = cat_match.group(1).title()
            continue
        task_match = re.match(r'\("([^"]+)",\s*\(([^)]*)\)\),?', line)
        if task_match:
            flags = [flag.strip() for flag in task_match.group(2).split(",")]
            active = [MONTHS[i] for i, flag in enumerate(flags[:12]) if flag == "Y"]
            rows.append([category, task_match.group(1), ", ".join(active) or "-"])
    return normalize_markdown(intro + "\n" + md_table(["Category", "Task", "Active Months"], rows))


def render_checklist(path: Path, refs: dict[str, str]) -> str:
    text = path.read_text(encoding="utf-8")
    before = text.split("#let Y = true", 1)[0]
    intro = convert_typst_markdown(before, refs=refs)
    output = [intro.strip(), ""]
    in_list = False
    current = ""
    for raw in text.splitlines():
        line = raw.strip()
        if line.startswith("#let task-checklist"):
            in_list = True
            continue
        if not in_list:
            continue
        if line == ")":
            break
        cat_match = re.match(r'"([^"]+)",$', line)
        if cat_match:
            current = cat_match.group(1)
            if output and output[-1] != "":
                output.append("")
            output.extend([f"## {current}", ""])
            continue
        task_match = re.match(r'\("([^"]+)",\s*[YN]\),?', line)
        if task_match:
            output.append(f"- [ ] {task_match.group(1)}")
    return normalize_markdown("\n".join(output))


def render_topic(path: Path, key: str, refs: dict[str, str], plants: list[dict]) -> str:
    if key == "task_grid":
        return render_task_grid(path, refs)
    if key == "checklist":
        return render_checklist(path, refs)
    return convert_typst_markdown(path.read_text(encoding="utf-8"), refs=refs, plants=plants)


def write_text(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def copy_file(source: Path, target: Path) -> None:
    target.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source, target)


def note_title(path: Path) -> str:
    text = path.read_text(encoding="utf-8", errors="ignore")
    for line in text.splitlines():
        if line.startswith("# "):
            return line[2:].strip()
    return path.stem.replace("_", " ").title()


def markdown_files_under(snapshot: Path, folder: str) -> list[Path]:
    directory = snapshot / folder
    if not directory.exists():
        return []
    return sorted(directory.glob("*.md"))


def decision_like_notes() -> list[Path]:
    candidates = sorted((ROOT / "docs").glob("*.md")) + sorted((ROOT / "notes").glob("*.md"))
    matches = []
    for path in candidates:
        stem = path.stem.lower()
        if any(term in stem for term in DECISION_TERMS):
            matches.append(path)
    return matches


def summarize_markdown_file(path: Path, max_bullets: int = 4) -> list[str]:
    bullets: list[str] = []
    for raw in path.read_text(encoding="utf-8", errors="ignore").splitlines():
        line = raw.strip()
        if line.startswith("- "):
            bullets.append(line)
        elif line.startswith("**") and line.endswith("**"):
            bullets.append(f"- {line.strip('*')}")
        if len(bullets) >= max_bullets:
            break
    return bullets


def render_important_constraints() -> str:
    manual = [
        "- Use this project as property-specific guidance for Commerce City, Colorado, Zone 5b.",
        "- Treat soil as heavy clay/clay-fill despite Web Soil Survey native-series data.",
        "- Never add phosphorus to in-ground plants; high P worsens micronutrient lockout.",
        "- Drip irrigation uses a shared schedule; tune individual plants by emitter count, placement, or stop date.",
        "- Silver Maples and Honeylocust are sprinkler-irrigated through lawn zones, not drip zones.",
        "- Containers are manually watered and do not follow in-ground soil constraints.",
    ]
    source_files = [
        ROOT / "notes" / "property.md",
        ROOT / "notes" / "soil.md",
        ROOT / "notes" / "irrigation.md",
        ROOT / "notes" / "container_inventory.md",
    ]
    source_links = [
        f"- {rel_md_link('notes/' + source.name, note_title(source))}"
        for source in source_files
        if source.exists()
    ]
    return "\n".join(manual + ["", "Constraint source files:"] + source_links)


def render_index(plants: list[dict]) -> str:
    docs_context = ROOT / "docs" / "context.md"
    context_text = docs_context.read_text(encoding="utf-8")
    decision_files = decision_like_notes()

    lines = [
        "# Plant Guide ChatGPT Snapshot",
        "",
        f"Generated: {dt.date.today().isoformat()}",
        "",
        "## Purpose",
        "",
        "This is a cleaned snapshot of the Plant Guide repository for use as uploaded context in ChatGPT Projects.",
        "",
        "## How to Use",
        "",
        "When answering questions, start here, then inspect relevant files. Prefer canonical data in `data/`, plant-specific detail in `plants/`, and property rationale in `notes/` and `decisions/`.",
        "",
        "## Key Data Sources",
        "",
        "- `data/plants.toml` - structured plant data and canonical roster/order",
        "- `plants/` - plant-specific notes converted from the guide source",
        "- `topics/` - watering, soil, fertilizer, wildlife, weed control, checklist, task grid, products, and lawn guide",
        "- `notes/` - working notes, property rationale, and product-label summaries",
        "- `decisions/` - planter and property decisions copied from docs",
        "- `research/` - source/audit notes",
        "",
        "## Plants",
        "",
    ]

    for group in GROUP_ORDER:
        group_plants = [plant for plant in plants if plant.get("group") == group]
        if not group_plants:
            continue
        lines.extend([f"### {GROUP_LABELS[group]}", ""])
        for plant in group_plants:
            page = f"plants/{plant['file']}.md"
            details = f"{plant.get('latin', '')}; irrigation: {plant.get('irrigation', '')}; established: {plant.get('established', '')}"
            lines.append(f"- {rel_md_link(page, plant['name'])} ({details})")
        lines.append("")

    lines.extend(
        [
            "## Topics",
            "",
        ]
    )
    for key in TOPIC_SOURCES:
        title = key.replace("_", " ").title()
        lines.append(f"- {rel_md_link(f'topics/{key}.md', title)}")
    for key in EXTRA_TOPIC_DOCS:
        title = key.replace("_", " ").title()
        lines.append(f"- {rel_md_link(f'topics/{key}.md', title)}")

    lines.extend(
        [
            "",
            "## Locations / Property Context",
            "",
            f"- {rel_md_link('notes/property.md', 'Property Layout & Plant Locations')}",
            f"- {rel_md_link('notes/irrigation.md', 'Irrigation — Reasoning & Decisions')}",
            f"- {rel_md_link('notes/container_inventory.md', 'Container Inventory & Site Notes')}",
            f"- {rel_md_link('notes/rose_bacopa_planters.md', 'Rose/Bacopa planter notes')}",
            f"- {rel_md_link('notes/other_planter_planting_concepts.md', 'Other planter planting concepts')}",
            f"- {rel_md_link('decisions/front_rose_planter_redo.md', 'Front rose planter redo decision')}",
            f"- {rel_md_link('decisions/other_planter_planting_concepts.md', 'Other planter planting concepts decision')}",
            "",
            "## Active Decisions",
            "",
        ]
    )
    for path in decision_files:
        if path.parent.name == "docs":
            folder = "decisions" if path in DECISION_DOCS else "notes"
        else:
            folder = "notes"
        target_name = path.name if folder != "notes" or path.parent.name != "docs" else f"doc_{path.name}"
        lines.append(f"- {rel_md_link(f'{folder}/{target_name}', note_title(path))}")

    lines.extend(
        [
            "",
            "## Important Constraints",
            "",
            render_important_constraints(),
            "",
            "## Research",
            "",
        ]
    )
    research = sorted((ROOT / "notes" / "research").glob("*.md"))
    if research:
        for item in research:
            lines.append(f"- {rel_md_link(f'research/{item.name}', note_title(item))}")
    else:
        lines.append("- No research files present.")

    lines.extend(
        [
            "",
            "## Suggested Prompt",
            "",
            '> "Use this snapshot as the source of truth. Evaluate [plant] for [location], considering water, soil, exposure, planter constraints, winter risk, maintenance, and prior notes."',
            "",
            "## Directory Map",
            "",
            "- `README.md`, `AGENTS.md`: project orientation and agent instructions.",
            "- `data/`: canonical TOML facts for plants, soil, inventory, and lawn program.",
            "- `plants/`: Markdown plant care pages converted from the guide source.",
            "- `topics/`: Markdown guide sections and supporting docs.",
            "- `notes/`: internal rationale, property context, and planning notes.",
            "- `decisions/`: decision-oriented docs copied from `docs/`.",
            "- `research/`: current research/audit notes.",
            "",
            "## Source Context Excerpt",
            "",
            context_text.strip(),
        ]
    )
    return normalize_markdown("\n".join(lines))


def build_snapshot(staging_root: Path, include_images: bool) -> SnapshotStats:
    stats = SnapshotStats(images_included=include_images)
    snapshot = staging_root / SNAPSHOT_DIR
    plants = load_plants()
    plants_by_file = plant_map(plants)
    refs = snapshot_refs()

    write_text(snapshot / "index.md", render_index(plants))

    for filename in ("README.md", "AGENTS.md", "TODO.md"):
        source = ROOT / filename
        if source.exists():
            copy_file(source, snapshot / filename)

    for source in sorted((ROOT / "data").glob("*.toml")):
        copy_file(source, snapshot / "data" / source.name)

    for source in sorted((ROOT / "content" / "plants").glob("*.typ")):
        plant = plants_by_file.get(source.stem)
        if plant is None:
            raise ValueError(f"{source} has no matching data/plants.toml entry")
        write_text(
            snapshot / "plants" / f"{source.stem}.md",
            render_plant_page(source, plant, refs, plants, include_images),
        )
        stats.plants_converted += 1

    for key, source in TOPIC_SOURCES.items():
        write_text(snapshot / "topics" / f"{key}.md", render_topic(source, key, refs, plants))
        stats.topics_converted += 1

    for key, source in EXTRA_TOPIC_DOCS.items():
        if source.exists():
            copy_file(source, snapshot / "topics" / f"{key}.md")
            stats.topics_converted += 1

    for source in sorted((ROOT / "notes").glob("*.md")):
        copy_file(source, snapshot / "notes" / source.name)
        stats.notes_copied += 1

    product_labels_dir = ROOT / "notes" / "product_labels"
    if product_labels_dir.exists():
        for source in sorted(product_labels_dir.rglob("*.md")):
            target = snapshot / "notes" / "product_labels" / source.relative_to(product_labels_dir)
            copy_file(source, target)
            stats.notes_copied += 1

    context_doc = ROOT / "docs" / "context.md"
    if context_doc.exists():
        copy_file(context_doc, snapshot / "notes" / "project_context.md")
        stats.notes_copied += 1

    for source in DECISION_DOCS:
        if source.exists():
            copy_file(source, snapshot / "decisions" / source.name)
            stats.decisions_copied += 1

    research_dir = ROOT / "notes" / "research"
    if research_dir.exists():
        for source in sorted(research_dir.glob("*.md")):
            copy_file(source, snapshot / "research" / source.name)
            stats.research_copied += 1

    if include_images:
        for source in sorted((ROOT / "images").glob("*.jpg")):
            copy_file(source, snapshot / "images" / source.name)
            stats.images_copied += 1

    return stats


def write_zip(staging_root: Path) -> int:
    DIST.mkdir(parents=True, exist_ok=True)
    if ZIP_PATH.exists():
        ZIP_PATH.unlink()

    count = 0
    snapshot = staging_root / SNAPSHOT_DIR
    with zipfile.ZipFile(ZIP_PATH, "w", compression=zipfile.ZIP_DEFLATED) as archive:
        for path in sorted(snapshot.rglob("*")):
            if path.is_file():
                archive.write(path, path.relative_to(staging_root).as_posix())
                count += 1
    return count


def validate_zip(path: Path) -> None:
    with zipfile.ZipFile(path) as archive:
        names = archive.namelist()

    roots = {name.split("/", 1)[0] for name in names if name}
    if roots != {SNAPSHOT_DIR}:
        raise ValueError(f"Unexpected zip root(s): {', '.join(sorted(roots))}")

    banned_hits = [
        name
        for name in names
        if any(part in name for part in BANNED_ZIP_PARTS)
    ]
    if banned_hits:
        joined = "\n  ".join(banned_hits)
        raise ValueError(f"Snapshot contains banned entries:\n  {joined}")

    typ_files = [name for name in names if name.endswith(".typ")]
    if typ_files:
        joined = "\n  ".join(typ_files)
        raise ValueError(f"Snapshot contains raw Typst files:\n  {joined}")


def print_summary(stats: SnapshotStats) -> None:
    size_mb = stats.zip_size_bytes / (1024 * 1024)
    image_line = (
        f"Images included: {stats.images_copied}"
        if stats.images_included
        else "Images skipped: pass --include-images to include JPGs"
    )
    print(f"Created {ZIP_PATH.relative_to(ROOT)}")
    print(f"Files included: {stats.files_included}")
    print(f"Plants converted: {stats.plants_converted}")
    print(f"Topics converted: {stats.topics_converted}")
    print(f"Notes copied: {stats.notes_copied}")
    print(f"Decisions copied: {stats.decisions_copied}")
    print(f"Research files copied: {stats.research_copied}")
    print(image_line)
    print(f"Size: {size_mb:.2f} MB")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Build a ChatGPT-friendly project snapshot zip.")
    parser.add_argument(
        "--include-images",
        action="store_true",
        help="Include images/*.jpg in the snapshot. Default is text-only.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    with tempfile.TemporaryDirectory(prefix="plant-guide-chatgpt-") as tmp:
        staging_root = Path(tmp)
        stats = build_snapshot(staging_root, include_images=args.include_images)
        stats.files_included = write_zip(staging_root)
    validate_zip(ZIP_PATH)
    stats.zip_size_bytes = ZIP_PATH.stat().st_size
    print_summary(stats)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
