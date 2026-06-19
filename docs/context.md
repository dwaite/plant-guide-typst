# Plant Care Guide Context

Shared project context for AI coding agents. Agent-specific behavior should live in
`AGENTS.md`; duplicated domain facts should not.

## What This Is
A Typst document project that compiles to a PDF plant care guide for a specific
residential property in Commerce City, Colorado (Zone 5b).

## Product Boundary
- **Project output:** the compiled guide (`dist/plant_care_guide.pdf`) and its source
  document files in `content/`, `main.typ`, and `template.typ`.
- **Internal support artifacts:** `notes/` and any audit records. These exist to
  justify or update guidance, but are not the end product.
- **Operational journal:** `notes/2026_journal.md` records dated work actually
  performed during the season.

## Core Commands
- `make build` — compile PDF
- `make watch` — watch mode
- `make verify` — lint-data + generated-file check + compile check + image check + content/data consistency
- `make generate` — regenerate `content/generated/plant_data.typ` from `data/plants.toml`

## Key Property Facts
- **Location:** Commerce City, CO, Zone 5b
- **Soil:** Heavy clay (observational), pH 7.27
- **Nutrient profile:** HIGH phosphorus, LOW nitrogen, LOW potassium, VERY LOW micronutrients
- **Critical rule:** Never add phosphorus to any in-ground plant
- **Last frost:** ~May 10
- **First fall frost:** ~October 5
- **Time zone:** All dated schedules, watering windows, and operational notes use
  Commerce City / Denver local time (`America/Denver`) unless explicitly stated.
  Do not interpret times as UTC or as a system/server time zone.
- **Wind:** Significant; prevailing winter winds from north and northwest
- **2026 drought program:** South Adams County Water & Sanitation District declared
  Stage 1 drought restrictions on May 13, 2026. This property's assigned outdoor
  irrigation days are Wednesday and Saturday; no irrigation is allowed 10am–6pm or
  on Mondays. Residential water above 11,999 gal/month carries a drought surcharge.

## Irrigation Reality (Non-Negotiable)
There are three systems. Recommendations must match system constraints:
- **Drip:** all trees/shrubs except Silver Maples + Honeylocust; shared schedule
- **Sprinkler (Rachio):** Silver Maples + Honeylocust
- **Manual:** potted plants only

Do not write recommendations as if each plant has its own independent schedule.
Use emitter configuration and placement for per-plant drip adjustments.

During active drought restrictions, legal watering days and time windows override
generic interval-based schedules. The controller is currently set for weather-based
adaptive watering with rain/saturation skips, Wind Skip disabled, and a 50%
soil-depletion trigger.
Current operating constraints: front sprinkler program worst case ~287 min / ~4,000
gal starting at midnight; back sprinkler program ~80 active watering min over an
elapsed controller window ending at midnight; drip program ~84 min total across
three zones (~28 min/zone) with saturation and rain skips.

## Establishment Context
Most 2024-installed plants are still in establishment through summer 2026 and need
higher attention to watering and mulch. See `notes/establishment.md`.

## 2026 Pot Update
Candytuft did not survive winter 2025–26. It has been removed from the active plant
roster, and the front accent pots were redone for the 2026 season with White
Bacopa companions. The south-side rose/bacopa planter is being tracked as a
self-watering experiment.

## Core Model
- **Data:** `data/plants.toml` (canonical facts)
- **Data:** `data/soil.toml`, `data/lawn_program.toml`, `data/inventory.toml` (non-plant canonical facts and constraints)
- **Reasoning inputs:** `notes/*.md` (why decisions were made; internal only)
- **Document output source:** `content/**/*.typ`, `main.typ`, `template.typ` (presentation)

### Audit Lifecycle
- Audit files (for example `notes/research/*`) are **temporary verification
  work products** used when validating or re-validating guidance.
- After audited guidance is integrated into data/content and verified, audit
  files may be archived or removed until the next audit cycle.
- Do not treat prior audit artifacts as permanent project outputs.

When facts change (plant replacement, irrigation type, emitter setup), update the
data layer first, then reconcile notes and document.

## File Roles
- `main.typ` — section ordering and assembly
- `template.typ` — style system, helper functions
- `content/watering.typ` — irrigation schedule + emitter config table
- `content/fertilizer.typ` — nutrient strategy + generated fertilizer matrix
- `content/products.typ` — product details, compatibility, sourcing
- `content/checklist.typ` — month-by-month execution checklist
- `content/plants/*.typ` — per-plant prose
- `content/generated/plant_data.typ` — generated emitter + fertilizer tables (do not hand edit)
- `notes/2026_journal.md` — dated operational log for actual applications,
  inspections, irrigation/controller changes, pruning, planting, and field observations
- `notes/*.md` — internal rationale, decision records, and seasonal context; do not
  use topic notes as the primary place for day-by-day completed-work logs

## Data-Driven Generation
Generated file:
- `content/generated/plant_data.typ` (from `scripts/generate_plant_data_typ.py`)
- `content/generated/reference_data.typ` (from `scripts/generate_reference_data_typ.py`)

Canonical source fields in `data/plants.toml`:
- `fertilizer_program` for all plants
- `emitter_display` and `emitter_note` for drip-irrigated plants

Canonical non-plant data files:
- `data/soil.toml` for soil profile rows and pH constants
- `data/lawn_program.toml` for annual lawn N range and pass structure
- `data/inventory.toml` for constrained inventory decisions (for example Preen stock)

If you edit data/mappings affecting generated tables, run:
1. `make generate`
2. `make verify`

## Validation Requirement
Run `make verify` before declaring work complete.
