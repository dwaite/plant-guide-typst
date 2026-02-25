// ============================================================
// IRRIGATION & WATERING
// Edit schedule, emitter table, and system descriptions below.
// ============================================================
#import "../template.typ": *

#pagebreak(weak: true)
= Irrigation & Watering

This property uses three distinct irrigation systems. Understanding which system
serves each plant is essential for making sense of the watering guidance throughout
this document.

// ── Drip System ───────────────────────────────────────────────
== Drip System

All trees and shrubs except the Silver Maples and Skyline Honeylocust are on drip
irrigation. All drip zones share a single schedule — frequency and run time apply
uniformly across every zone. *Emitter output rate (gph) at each plant is the only
per-plant adjustment available.* Plant-specific watering guidance throughout this
document is expressed in terms of emitter sizing, not schedule frequency.

=== Recommended Schedule

#table(
  columns: (1.2fr, 1fr, 2.8fr),
  fill: tbl-fill,
  stroke: tbl-stroke,
  align: (left, left, left),

  tbl-header-text[Period],
  tbl-header-text[Interval],
  tbl-header-text[Notes],

  [April – May],     [Every 5–6 days], [Spring ramp-up. Clay retains winter moisture — start conservatively and observe.],
  [June – August],   [Every 3 days],   [Peak demand. Right for the thirstiest drip plant (Japanese Maple at high emitter output). Clay's moisture retention means every-other-day would keep most plants too wet.],
  [September – October], [Every 6–7 days], [Taper down. Fall precipitation contributes; reduce run time as temperatures drop.],
  [November – March], [System off],    [Winter watering done manually. See Winter Watering below.],
)

Run time per zone: 30–45 minutes. Reduce if clay surface shows pooling or runoff before the cycle ends. If drip zones are configured in Rachio, enabling Smart Cycle (soak and cycle) improves water penetration into clay without runoff, and ET/MAD on drip zones will automatically shorten intervals during heat waves.

=== Emitter Sizing

Size emitters at each plant to match its water demand. The schedule runs identically for all zones; emitter output is what differentiates a thirsty tree from a drought-tolerant perennial.

#table(
  columns: (2.2fr, 0.8fr, 3fr),
  fill: tbl-fill,
  stroke: tbl-stroke,
  align: (left, left, left),

  tbl-header-text[Plant],
  tbl-header-text[Emitter],
  tbl-header-text[Rationale],

  [Emperor Japanese Maple],         [2 gph], [Highest demand on the property; full afternoon sun; shallow roots feel drought quickly.],
  [Spring Snow Crabapple],          [1 gph], [Establishing tree; moderate-high demand.],
  [Autumn Brilliance Serviceberry], [1 gph], [Establishing tree; elevated demand due to south-facing full-sun exposure.],
  [Yankee Doodle Lilac],            [1 gph], [Larger establishing shrub; moderate demand.],
  [Wichita Blue Juniper],           [0.5 gph], [Establishing evergreen; drought tolerant once established; overwatering is the greater risk.],
  [Dwarf Globe Blue Spruce],        [0.5 gph], [Establishing evergreen; moderate-low demand; clay crown drainage critical.],
  [Mops Mugo Pine],                 [0.5 gph], [Drought tolerant; low demand; sensitive to overwatering.],
  [Miss Kim Lilac],                 [0.5 gph], [Fully established (2022); east-facing afternoon shade reduces demand.],
  [Peking Cotoneaster],             [0.5 gph], [Very drought tolerant; low demand.],
  [Dark Knight Bluebeard],          [0.5 gph], [Drought tolerant; prefers dry conditions; overwatering in clay is a kill risk.],
  [Northwind Switchgrass],          [0.5 gph], [Native grass; moderate-low demand.],
  [Daylilies],                      [0.5 gph], [Fully established (2022); east-facing afternoon shade reduces demand.],
  [Agastache Sunset Hyssop],        [0.5 gph], [Drought tolerant; needs the least water per cycle on the shared schedule.],
  [Rocky Mountain Penstemon],       [0.5 gph], [Native; drought tolerant; dry fall essential for survival in clay.],
  [White Yarrow],                   [0.5 gph], [Very drought tolerant; roots susceptible to rot in persistently wet soil.],
  [Blonde Ambition Blue Grama],     [0.5 gph], [Native prairie grass; very drought tolerant; thrives with minimal supplemental water.],
  [Autumn Joy Sedum],               [0.5 gph], [Drought tolerant; extended wet conditions in clay reduce quality and cause flopping.],
)

#warning-callout("Japanese Maple — Supplemental Watering Exception")[
  During extended heat waves in July and August (3 or more consecutive days above
  95°F), the every-3-day schedule at 2 gph may not fully meet this tree's needs in
  its full-afternoon-sun location. Supplemental hand watering at the drip line during
  these events is appropriate — a slow soak with a hose at the outer root zone. This
  is a documented system constraint, not a general recommendation. All other drip
  plants are adequately served by emitter sizing on the shared schedule.
]


// ── Sprinkler System ──────────────────────────────────────────
== Sprinkler System (Rachio)

The Silver Maples and Skyline Honeylocust are in the center of the front yard lawn
zones and receive water exclusively from the Rachio sprinkler system — they are not
on the drip system. Rachio ET/MAD weather intelligence is already enabled on these
zones and handles routine weather-based adjustment automatically.

The Silver Maples are fully established (since 2022) and self-sufficient under normal
sprinkler coverage. The Skyline Honeylocust is a second-season plant and may benefit
from supplemental hand watering at its drip line during extended heat waves, as
sprinkler coverage calibrated for established turf may underserve a young tree in
full summer sun.


// ── Manual Watering ───────────────────────────────────────────
== Manual Watering (Potted Plants)

Knock Out Roses, White Bacopa, and Candytuft are in containers and are watered
manually. Check soil moisture by pressing a finger 2 inches into the mix — water
when dry at that depth. The east-facing, afternoon-shaded exposure means daily
watering is not always necessary. Water thoroughly until it runs freely from drainage
holes; do not allow pots to sit in standing water.


// ── Winter Watering ───────────────────────────────────────────
== Winter Watering

The drip system is off from approximately November through March. During this period,
all drip-irrigated trees and shrubs need occasional deep watering by hand on any day
when temperatures rise above 40°F and the soil is not frozen. December through
February are typically Commerce City's driest months, and roots continue to lose
moisture even when plants are fully dormant.

Run a hose slowly at the drip line of each tree and shrub for 15–20 minutes, or until
water begins to pool. Focus first on the trees (Silver Maples, Honeylocust, Crabapple,
Serviceberry, Japanese Maple), then the evergreens (Juniper, Blue Spruce, Mugo Pine),
which are especially vulnerable to winter desiccation given Commerce City's prevailing
north and northwest winds. Shrubs can go longer between winter waterings than trees
and evergreens.

Potted plants in storage should be checked monthly — soil should feel barely damp,
not dry and not wet.
