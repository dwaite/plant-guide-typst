# Commerce City Plant Care Guide — Typst Project

A plant care guide for a specific residential property in Commerce City, Colorado (Zone 5b),
built with [Typst](https://typst.app) — a modern typesetting system that compiles to PDF.

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
typst compile main.typ plant_care_guide.pdf
```

**Watch mode** (auto-recompiles on save — great for editing):
```bash
typst watch main.typ plant_care_guide.pdf
```

Open `plant_care_guide.pdf` in any PDF viewer. Most PDF viewers auto-refresh
when the file changes, giving you a near-live preview while editing.

---

## Project Structure

```
main.typ              ← Entry point: document ordering only, edit to reorder sections
template.typ          ← All styling (colours, fonts, heading styles, helper functions)
                        Edit this to change how things look
content/
  soil.typ            ← Soil profile, nutrient table, recommended products
  wildlife.typ        ← Wildlife species table
  fertilizer.typ      ← Per-plant fertilizer application table
  weed_control.typ    ← Three-zone weed control guide
  task_grid.typ       ← 12-month visual task grid
  calendar.typ        ← Seasonal calendar + monthly checklist
  plants/
    silver_maple.typ  ← One file per plant — mostly readable prose
    honeylocust.typ
    ... (22 total)
images/
  maple.jpg, ...      ← 22 plant photos
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

### To change colours, fonts, or heading styles:
Edit `template.typ`. The colour palette is defined at the top.

---

## Key Property Facts (for Claude Code context)

- **Location:** Commerce City, CO, Zone 5b
- **Soil:** Clay-dominant, pH 7.27, HIGH phosphorus, LOW nitrogen & potassium,
  VERY LOW micronutrients (Fe, Zn, Cu, B, Mn)
- **Critical rule:** Never add phosphorus to any in-ground plant. Ever.
- **Last frost:** ~May 10 · **First fall frost:** ~October 5
- **22 plants** across 7 groups (Trees, Evergreens, Shrubs, Lawn, Perennials,
  Ornamental Grasses, Potted Plants)
