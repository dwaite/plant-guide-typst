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
- **Soil:** Heavy clay (observational — no particle size analysis performed), pH 7.27
  - HIGH phosphorus → never add P to any in-ground plant, ever
  - LOW nitrogen → supplement per plant
  - LOW potassium → supplement with granular 0-0-50 (trees/shrubs) or liquid 0-0-25 (lawn)
  - VERY LOW micronutrients (Fe, Zn, Cu, B, Mn) → annual chelated micronutrient blend in May
- **Last frost:** ~May 10 · **First fall frost:** ~October 5
- **Wind:** Significant; prevailing winter winds from north and northwest

## Irrigation System
Three distinct systems — do not write watering recommendations as if plants have
individually controllable schedules. Frame drip guidance around emitter output, not
frequency.

- **Drip system:** All trees and shrubs except Silver Maples and Honeylocust. All
  drip zones share one schedule. Emitter output rate (gph) is the primary per-plant
  adjustment mechanism.
- **Sprinkler system (Rachio):** Silver Maples and Skyline Honeylocust are in the
  center of lawn zones — sprinkler-only. Rachio ET/MAD weather intelligence is
  already enabled on lawn zones.
- **Manual watering:** Potted plants only. Check soil at 2-inch depth; daily
  watering not always necessary given east-facing afternoon shade.

## Plant Ages & Establishment Status
The 2024 cohort (all trees, shrubs, perennials, and grasses except Silver Maples,
Miss Kim Lilacs, Daylilies, and Kentucky Bluegrass lawn) is in its second —
highest-risk — establishment season through summer 2026. Extra attention to
watering and mulch applies to all 2024 plants. See `notes/establishment.md` for
the full cohort list, per-plant concerns, and season log.

New 2025 potted plants: Knock Out Roses, Bacopa (annual), Candytuft (survival
through winter 2025–26 uncertain — see Pending below).

## Sun Exposure by Location
See the Sun Exposure Groups table in `notes/property.md`. Key writing constraints:
Japanese Maple and Blue Spruce receive more afternoon sun than either species
prefers; Serviceberry has the most stressful full-south exposure on the property.

## Pending / Deferred
- **Candytuft survival:** Do not edit `candytuft.typ` until spring 2026 confirms
  survival or loss. See handoff notes within that file for what to do in each case.

## Three-Layer Structure

| Layer | Location | Purpose |
|-------|----------|---------|
| **Data** | `data/plants.toml` | Canonical facts: emitter sizes, irrigation type, establishment year, sun zone, pH preference. Edit when a physical fact changes. |
| **Reasoning** | `notes/*.md` | The *why* behind recommendations — decision rationale, trade-offs, observations. Edit when logic changes or observations update. |
| **Document** | `content/`, `main.typ` | Presentation layer — concise prose and tables derived from data + reasoning. Edit when the printed guide needs to change. |

The document is a *derived* artifact. If data or reasoning changes, evaluate whether
the document needs updating, but the notes files are the source of truth for *why*
recommendations are what they are.

### Notes Files

| File | Contents |
|------|---------|
| `notes/irrigation.md` | Zone architecture, schedule decision (Option B), emitter sizing rationale, drip stop decisions |
| `notes/fertilizer.md` | High-P constraint, EDDHA iron rationale, acidifying fertilizer trade-offs, per-group strategies |
| `notes/amendments.md` | Organic amendments and soil biology: humic acid, compost tea, mycorrhizal inoculants, wetting agent (Revive), gypsum rationale |
| `notes/soil.md` | Soil test results, pH context, Ca/P/micronutrient lockout mechanism, what to retest and when |
| `notes/establishment.md` | Cohort status, per-plant concerns (Miss Kim, JM, Bluebeard), season log |
| `notes/property.md` | Lot layout, zone descriptions, plant-to-location mapping, sun exposure groups, bed types, design deviations (Serviceberry→JM substitution, Agastache species confirmation) |
| `notes/products.md` | Delivery system guide (M12 vs. hose-end vs. granular), tank mixing rules, product list by task with brand names, annual supply order reference |

## File Roles

| File | Purpose | Edit for... |
|------|---------|-------------|
| `Makefile` | Build targets: `build`, `watch`, `open`, `clean`, `check`, `images` | Adding build steps |
| `main.typ` | Document assembly and ordering only | Reordering sections, adding new plant files |
| `template.typ` | All styling — colours, fonts, helper functions | Visual changes, new helper functions |
| `content/watering.typ` | Irrigation & Watering section — drip schedule, emitter sizing table, sprinkler/manual notes | Drip schedule changes, emitter size changes for any plant |
| `content/soil.typ` | Soil profile table — nutrient status, pH context, management notes | Soil data changes |
| `content/wildlife.typ` | Wildlife species table | Adding/editing species or food ratings |
| `content/fertilizer.typ` | Per-plant application table | Fertilizer changes for any plant |
| `content/weed_control.typ` | Three-zone weed guide | Weed control updates |
| `content/task_grid.typ` | 12-month visual task grid | Adding/changing active months per task |
| `content/checklist.typ` | Spring 2026 priority callout + month-by-month checkbox checklist (no overview table) | Adding/editing seasonal tasks |
| `content/plants/*.typ` | One file per plant — mostly prose | Plant care text, callouts |

## Plants (23 total)

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
| Potted | `bacopa.typ` | White Bacopa (Snowstorm Giant Snowflake) — annual |
| Potted | `candytuft.typ` | Candytuft — survival uncertain, see Pending above |

## Template Functions Reference

```typst
// Callout boxes
#warning-callout("Title")[content]   // amber left border
#info-callout("Title")[content]      // green left border
#danger-callout("Title")[content]    // red left border

// Plant page components
#plant-header("Name", "Latin name", "image-filename")[overview text]
// image-filename = stem only, e.g. "maple" for images/maple.jpg
// Image crops to 112pt × 181pt (golden ratio portrait), top-center by default.
// Per-plant crop adjustment (optional named args):
//   img-dx: horizontal shift in pt — negative = left, positive = right
//   img-dy: vertical shift in pt  — negative = up,   positive = down

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
- Watering recommendations must reflect the actual irrigation system: emitter
  output for drip plants, Rachio sprinkler for Silver Maples and Honeylocust,
  manual soil-check for potted plants — never write as if each plant has its own
  independently scheduled drip zone
- Always test with `make build` (or `make check`) after making changes; fix any
  compile errors before reporting done
- The owner will typically describe what they want changed in plain English —
  find the right file(s), make the edit, and compile to verify
