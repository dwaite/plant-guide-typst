#!/usr/bin/env python3
"""Lint style/consistency rules for data/plants.toml."""

from __future__ import annotations

import re
import sys
import tomllib
from pathlib import Path


DATA_FILE = Path(__file__).resolve().parents[1] / "data" / "plants.toml"
EMITTER_DISPLAY_RE = re.compile(r"^\d+(?:-\d+)? x \d+(?:\.\d+)? gph$")


def error(msg: str) -> None:
    print(f"[lint-data] {msg}", file=sys.stderr)


def validate_sentence(name: str, field: str, value: str, max_len: int) -> list[str]:
    errs: list[str] = []
    if len(value) > max_len:
        errs.append(f"{name}: {field} exceeds {max_len} chars ({len(value)})")
    if value != value.strip():
        errs.append(f"{name}: {field} has leading/trailing whitespace")
    if "  " in value:
        errs.append(f"{name}: {field} contains double spaces")
    if value and not value[0].isupper():
        errs.append(f"{name}: {field} should start with uppercase letter")
    if not value.endswith("."):
        errs.append(f"{name}: {field} should end with a period")
    return errs


def main() -> int:
    plants = tomllib.loads(DATA_FILE.read_text(encoding="utf-8"))["plants"]
    failures: list[str] = []

    for plant in plants:
        name = plant["name"]

        program = plant.get("fertilizer_program")
        if not program:
            failures.append(f"{name}: missing fertilizer_program")
        else:
            failures.extend(validate_sentence(name, "fertilizer_program", program, max_len=120))

        if plant.get("irrigation") == "drip":
            display = plant.get("emitter_display")
            note = plant.get("emitter_note")

            if not display:
                failures.append(f"{name}: missing emitter_display for drip plant")
            else:
                if display != display.strip():
                    failures.append(f"{name}: emitter_display has leading/trailing whitespace")
                if not EMITTER_DISPLAY_RE.match(display):
                    failures.append(
                        f'{name}: emitter_display "{display}" must match "N x G gph" or "N-M x G gph"'
                    )

            if not note:
                failures.append(f"{name}: missing emitter_note for drip plant")
            else:
                failures.extend(validate_sentence(name, "emitter_note", note, max_len=140))

    if failures:
        for item in failures:
            error(item)
        error(f"failed with {len(failures)} issue(s)")
        return 1

    print("[lint-data] data/plants.toml passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
