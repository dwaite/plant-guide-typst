# Plant Care Guide — Claude Code Context

## What This Is
A Typst document project that compiles to a PDF plant care guide for a specific
residential property in Commerce City, Colorado (Zone 5b).

```bash
typst compile main.typ plant_care_guide.pdf   # compile once
typst watch main.typ plant_care_guide.pdf      # watch mode (auto-recompile)
```

## Key Property Facts
- **Location:** Commerce City, CO, Zone 5b
- **Soil:** Clay-dominant, pH 7.27
  - HIGH phosphorus → never add P to any in-ground plant, ever
  - LOW nitrogen → supplement per plant
  - LOW potassium → supplement with 0-0-50 potassium sulfate
  - VERY LOW micronutrients (Fe, Zn, Cu, B, Mn) → annual chelated package in May
- **Last frost:** ~May 10 · **First fall frost:** ~October 5

## File Roles

| File | Purpose | Edit for... |
|------|---------|-------------|
| `main.typ` | Document assembly and ordering only | Reordering sections, adding new plant files |
| `template.typ` | All styling — colours, fonts, helper functions | Visual changes, new helper functions |
| `content/soil.typ` | Soil profile table + recommended products | Soil data, product recommendations |
| `content/wildlife.typ` | Wildlife species table | Adding/editing species or food ratings |
| `content/fertilizer.typ` | Per-plant application table | Fertilizer changes for any plant |
| `content/weed_control.typ` | Three-zone weed guide | Weed control updates |
| `content/task_grid.typ` | 12-month visual task grid | Adding/changing active months per task |
| `content/calendar.typ` | Seasonal calendar + monthly checklist | Adding/editing seasonal tasks |
| `content/plants/*.typ` | One file per plant — mostly prose | Plant care text, callouts |

## Plants (22 total)

| Group | File | Common Name |
|-------|------|-------------|
| Trees | `silver_maple.typ` | Silver Maple |
| Trees | `honeylocust.typ` | Skyline Honeylocust |
| Trees | `crabapple.typ` | Spring Snow Crabapple |
| Trees | `serviceberry.typ` | Autumn Brilliance Serviceberry |
| Trees | `japanese_maple.typ` | Emperor Japanese Maple |
| Evergreens | `juniper.typ` | Wichita Blue Juniper |
| Evergreens | `blue_spruce.typ` | Dwarf Globe Blue Spruce |
| Evergreens | `mugo_pine.typ` | Mops Mugo Pine |
| Shrubs | `cotoneaster.typ` | Peking Cotoneaster |
| Shrubs | `yankee_doodle_lilac.typ` | Yankee Doodle Lilac |
| Shrubs | `miss_kim_lilac.typ` | Miss Kim Lilac |
| Shrubs | `bluebeard.typ` | Dark Knight Bluebeard |
| Lawn | `bluegrass.typ` | Kentucky Bluegrass |
| Perennials | `daylilies.typ` | Daylilies |
| Perennials | `yarrow.typ` | White Yarrow |
| Perennials | `agastache.typ` | Agastache Sunset Hyssop |
| Perennials | `penstemon.typ` | Rocky Mountain Penstemon |
| Perennials | `sedum.typ` | Autumn Joy Sedum |
| Grasses | `blue_grama.typ` | Blonde Ambition Blue Grama |
| Grasses | `switchgrass.typ` | Northwind Switchgrass |
| Potted | `knockout_roses.typ` | Knock Out Roses |
| Potted | `candytuft.typ` | Candytuft |

## Template Functions Reference

```typst
// Callout boxes
#warning-callout("Title")[content]   // amber left border
#info-callout("Title")[content]      // green left border
#danger-callout("Title")[content]    // red left border

// Plant page components
#plant-header("Name", "Latin name", "image-filename")[overview text]
// image-filename = stem only, e.g. "maple" for images/maple.jpg

// Structural
#group-header("TREES")  // full-width dark green banner

// Table helpers (use in #table() blocks)
tbl-fill          // (x, y) => ... fill function (green header + alternating rows)
tbl-stroke        // standard border stroke
tbl-header-text[col]  // white bold header cell text

// Status colours (for soil table)
status-warn       // amber — ⚠ warnings
status-ok         // green — ✓ optimal
status-high       // red — excess levels
```

## Colour Palette (from template.typ)
```typst
forest        = rgb("#2E5E1E")   // dark green — headings, headers
forest-mid    = rgb("#3A7A20")   // medium green
active-cell   = rgb("#A8D08A")   // task grid active month
cat-cell      = rgb("#D5E8C8")   // task grid category row
amber         = rgb("#D4860A")   // warning callouts
amber-bg      = rgb("#FFF3CD")   // warning callout background
```

## How to Work With the Owner
- The owner knows their plants, property, and soil test results well — defer to
  their specific knowledge when there's a conflict with generic gardening advice
- Keep all advice tailored to Commerce City Zone 5b and this specific soil profile
  (alkaline, high-P, low micronutrients) — not generic gardening content
- Always test with `typst compile main.typ plant_care_guide.pdf` after making
  changes; fix any compile errors before reporting done
- The owner will typically describe what they want changed in plain English —
  find the right file(s), make the edit, and compile to verify
