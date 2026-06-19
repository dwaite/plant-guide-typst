# Commerce City Plant Care Guide — Typst Project

A plant care guide for a specific residential property in Commerce City, Colorado (Zone 5b),
built with [Typst](https://typst.app) — a modern typesetting system that compiles to PDF.

[![Build Plant Guide](https://github.com/dwaite/plant-guide-typst/actions/workflows/build-guide.yml/badge.svg)](https://github.com/dwaite/plant-guide-typst/actions/workflows/build-guide.yml)

Latest successful main-branch build:
- [Download the current PDF release asset](https://github.com/dwaite/plant-guide-typst/releases/latest/download/plant_care_guide.pdf)
- [Open the rolling latest release page](https://github.com/dwaite/plant-guide-typst/releases/latest)

## Project Intent

- **Primary deliverable:** the guide source (`content/`, `main.typ`,
  `template.typ`) and compiled PDF (`dist/plant_care_guide.pdf`).
- **Supporting rationale:** `notes/` captures decision rationale and maintenance
  context; it is an internal support layer, not an output artifact.
- **Audit records:** audit/source-ledger files are temporary verification
  artifacts used during audit cycles and may be archived or removed between
  audits once guidance has been integrated.

## Setup

**Install Typst** (one-time):
```bash
# macOS
brew install typst

# Windows
winget install --id Typst.Typst

# Linux (pre-built binary)
curl -fsSL https://github.com/typst/typst/releases/latest/download/typst-x86_64-unknown-linux-musl.tar.xz | tar -xJ
sudo mv typst-x86_64-unknown-linux-musl/typst /usr/local/bin/

# Or via cargo
cargo install typst-cli
```

**Compile the document:**
```bash
make build
```

**Watch mode** (auto-recompiles on save — great for editing):
```bash
make watch
```

**Validate all guardrails before finishing work:**
```bash
make verify
```

Open `dist/plant_care_guide.pdf` in any PDF viewer. Most PDF viewers auto-refresh
when the file changes, giving you a near-live preview while editing.

---

## Project Structure

```
main.typ              ← Entry point: document ordering only, edit to reorder sections
template.typ          ← All styling (colours, fonts, heading styles, helper functions)
                        Edit this to change how things look
content/
  soil.typ            ← Soil profile and nutrient status table
  products.typ        ← Recommended products, compatibility, and sourcing
  wildlife.typ        ← Wildlife species table
  fertilizer.typ      ← Per-plant fertilizer application table
  weed_control.typ    ← Three-zone weed control guide
  task_grid.typ       ← 12-month visual task grid
  checklist.typ       ← Seasonal monthly checkbox checklist
  generated/
    plant_data.typ    ← Auto-generated emitter + fertilizer tables
  plants/
    silver_maple.typ  ← One file per plant — mostly readable prose
    honeylocust.typ
    ... (23 total)
scripts/
  generate_plant_data_typ.py  ← Generates content/generated/plant_data.typ from data/plants.toml
  generate_reference_data_typ.py ← Generates content/generated/reference_data.typ from data/soil.toml, data/lawn_program.toml, and data/inventory.toml
.githooks/
  pre-commit          ← Runs make verify on commit
data/
  plants.toml         ← Canonical per-plant facts and generated fertilizer/emitter matrix inputs
  soil.toml           ← Canonical soil profile/status rows
  lawn_program.toml   ← Canonical lawn annual N range and pass schedule
  inventory.toml      ← Canonical constrained inventory decisions (e.g., on-hand Preen)
notes/
  *.md                ← Internal rationale and planning notes
  planters/           ← Container-specific setup, inventory, and follow-up notes
  research/           ← Temporary audit artifacts (not a permanent output layer)
images/
  maple.jpg, ...      ← 23 plant photos
```

---

## Editing Content

### To edit a plant's care information:
Open `content/plants/silver_maple.typ` (or whichever plant). The file looks like:

```typst
#plant-header("Silver Maple", "Acer saccharinum", "maple")[
  Your Silver Maple is the largest tree in your landscape...
]

=== Watering
Deep water 2–3 times per week...

=== Fertilization
Apply N-K formula in early spring...
```

Just edit the text. `===` creates a care section heading. No code knowledge needed.

### To add a warning callout:
```typst
#warning-callout("My Warning Title")[
  Warning text goes here...
]
```

### To add a general info callout:
```typst
#info-callout("Note")[
  Info text goes here...
]
```

### To add a hyperlink:
```typst
#link("https://example.com")[Link text here]
```

### To update the soil nutrient table:
Edit `content/soil.typ` — find the `#table(...)` block and edit the rows directly.

### To change which months are active in the task grid:
Edit `content/task_grid.typ` — find the `grid-data` array. Each task row is:
```typst
("Task label", (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)),
```
Use `Y` for active months and `N` for inactive.

### Validate before finishing edits:
```bash
make verify
```

### Regenerate data-derived tables after data/mapping edits:
```bash
make generate
```

### To change colours, fonts, or heading styles:
Edit `template.typ`. The colour palette is defined at the top.

### Enable the tracked pre-commit hook (one-time per clone):
```bash
make install-hooks
```

---

## Key Property Facts

- **Location:** Commerce City, CO, Zone 5b
- **Soil:** Clay-dominant, pH 7.27, HIGH phosphorus, LOW nitrogen & potassium,
  VERY LOW micronutrients (Fe, Zn, Cu, B, Mn)
- **Critical rule:** Never add phosphorus to any in-ground plant. Ever.
- **Last frost:** ~May 10 · **First fall frost:** ~October 5
- **23 plants** across 7 groups (Trees, Evergreens, Shrubs, Lawn, Perennials,
  Ornamental Grasses, Potted Plants)
