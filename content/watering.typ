// ============================================================
// IRRIGATION & WATERING
// Edit schedule, emitter table, and system descriptions below.
// ============================================================
#import "../template.typ": *
#import "generated/plant_data.typ": emitter-config-table

#pagebreak(weak: true)
= Irrigation & Watering

This property uses three distinct irrigation systems. Understanding which system
serves each plant is essential for making sense of the watering guidance throughout
this document.

// ── Drip System ───────────────────────────────────────────────
== Drip System

All trees and shrubs except the Silver Maples and Skyline Honeylocust are on drip
irrigation. All drip zones share a single schedule — frequency and run time apply
uniformly across every zone. *Emitter output rate and count at each plant are the
only per-plant adjustments available.* Plant-specific watering guidance throughout
this document is expressed in terms of emitter configuration, not schedule frequency.

Set the drip controller to start early morning (5–7 am). Drip timing is less
critical than sprinklers, but morning allows Smart Cycle soak-and-cycle sequences
to complete before midday and delivers moisture to the root zone during peak
photosynthesis hours rather than leaving roots in overnight-saturated clay.

=== Recommended Schedule

#table(
  columns: (1.2fr, 1fr, 4fr),
  fill: tbl-fill,
  stroke: tbl-stroke,
  align: (left, left, left),

  tbl-header-text[Period],
  tbl-header-text[Interval],
  tbl-header-text[Notes],

  [April – May],     [Every 5–6 days], [Spring ramp-up. Check soil before starting — clay may still hold moisture from the fall pre-freeze deep watering or spring snow events, but do not assume this in a dry year. Observe and adjust.],
  [June – August],   [Every 3 days],   [Peak demand. Right for the thirstiest drip plant (Japanese Maple at high emitter output). Clay's moisture retention means every-other-day would keep most plants too wet.],
  [September – October], [Every 6–7 days], [Taper down. Fall precipitation contributes; reduce run time as temperatures drop.],
  [November – March], [System off],    [Winter watering done manually. See Winter Watering below.],
)

Run time per zone: ~20 minutes. Enable Smart Cycle (soak and cycle) — Rachio will split this into shorter pulses with soak time between (e.g., 3 × 7 min), which penetrates clay far better than a single uninterrupted run. ET/MAD on drip zones will automatically shorten intervals during cool or wet periods.

=== Emitter Configuration

All emitters are 2 gph. Total output per plant is controlled by emitter *count*.
Trees and the Yankee Doodle Lilac use multiple emitters to meet higher demand within
the shared run time. At ~20 min, each 2 gph emitter delivers approximately 0.67 gal
per cycle.

For trees, distribute emitters around the drip line (outer canopy edge), not at the
trunk — feeder roots are at the drip line, and spacing emitters encourages lateral
root spread. Aim for 18–24 inches from the trunk for young trees.

#emitter-config-table

#warning-callout("Japanese Maple — Supplemental Watering Exception")[
  During extended heat waves in July and August (3 or more consecutive days above
  95°F), the every-3-day schedule at 3 × 2 gph may not fully meet this tree's needs
  in its full-afternoon-sun location. Supplemental hand watering at the drip line
  during these events is appropriate — a slow soak with a hose at the outer root zone.
  This is a documented system constraint, not a general recommendation.
]

#info-callout("Drought-Tolerant Plants — Watching for Too Much Water")[
  At 0.67 gal/cycle, drought-tolerant plants receive more than strictly necessary
  during establishment. Watch for these early signals and cap or remove emitters
  earlier in the season if they appear:
  - *Autumn Joy Sedum:* stems flopping outward in a ring rather than staying upright — the clearest early signal in the landscape.
  - *White Yarrow:* yellowing lower leaves, then flopping stems mid-season.
  - *Dark Knight Bluebeard:* yellowing despite wet soil, or wilting that doesn't recover in cool morning temperatures.
  - *Agastache / Penstemon:* softness or yellowing at the crown base.
  - *Juniper / Mugo Pine:* interior needle yellowing — monitor soil moisture at the crown in June rather than waiting for visible symptoms.
  Cap emitters earlier as the first response. Swap to a smaller emitter if a single
  cap date isn't enough to control moisture.
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

Knock Out Roses and White Bacopa are in containers and are watered
manually. Check soil moisture by pressing a finger 2 inches into the mix — water
when dry at that depth. The east-facing, afternoon-shaded exposure means daily
watering is not always necessary. Water thoroughly until it runs freely from drainage
holes; do not allow pots to sit in standing water.


// ── Winter Watering ───────────────────────────────────────────
== Winter Watering

The drip system is off from approximately November through March. During this period,
all drip-irrigated trees, evergreens, and shrubs except Dark Knight Bluebeard need
occasional deep watering by hand on any day when temperatures rise above 40°F and
the soil is not frozen. December through February are typically Commerce City's
driest months, and roots continue to lose moisture even when plants are fully dormant.

Run a hose slowly at the drip line of each tree and shrub for 15–20 minutes. Under
mulch the soil surface is not visible, so use time as the primary cue — 15 minutes
of slow flow from a partially open hose delivers adequate penetration into clay. If
water starts running off the outer edge of the mulch ring before 15 minutes, move
the hose inward and continue. Focus first on the trees (Silver Maples, Honeylocust,
Crabapple, Serviceberry, Japanese Maple), then the evergreens (Juniper, Blue Spruce,
Mugo Pine), which are especially vulnerable to winter desiccation given Commerce
City's prevailing north and northwest winds. Shrubs can go longer between winter
waterings than trees and evergreens. Dark Knight Bluebeard is the exception: keep
its crown on the dry side through fall and winter rather than adding routine warm-day
deep watering.

Potted plants in storage should be checked monthly — soil should feel barely damp,
not dry and not wet.
