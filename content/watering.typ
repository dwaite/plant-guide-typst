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

#warning-callout("2026 SACWSD Stage 1 Drought Program")[
  South Adams County Water & Sanitation District declared Stage 1 drought
  restrictions on May 13, 2026. For this property's assigned schedule, outdoor
  irrigation is limited to *Wednesday and Saturday*, with no irrigation between
  *10:00 am and 6:00 pm* and no residential watering on Mondays. The residential
  enforcement ladder begins with a warning, then fines for repeat violations; water
  use above 11,999 gal/month also carries a drought surcharge.

  Program the controller around the legal days first. Rachio ET/MAD, saturation
  skips, and rain skips should only skip or shorten irrigation — not create off-day
  catch-up watering without an exemption. Treat Wind Skip differently during the
  drought program; repeated wind skips can leave turf and young trees without legal
  automatic watering for more than a week.

  Source checked June 3, 2026: #link("https://www.southadamswaterco.gov/alert_detail.php")[SACWSD alert].
]

== Drought Program Priorities

The current schedule already addresses the main legal constraint: front sprinkler
zones start at midnight, back sprinkler zones end by midnight, and drip uses the
assigned days with saturation and rain skips. The useful changes outside schedule
timing are operational:

- *Audit delivery, not just minutes.* A free Slow the Flow audit or a careful
  catch-can test is high priority. The front program's worst-case run is about
  4,000 gallons, so one unnecessary full run is a meaningful share of the monthly
  no-surcharge tier.
- *Use soil checks before overrides.* If Rachio skips after rain or soil saturation,
  accept the skip unless a priority plant shows actual stress. Do not manually
  "make up" skipped water by running an off-day cycle.
- *Disable Wind Skip during restrictions.* Wind loss is real on this property, but
  an automatic wind skip can remove one of only two legal weekly watering windows.
  If Wednesday and Saturday are both windy, the lawn may go more than a week without
  irrigation and the later catch-up run will be longer and less efficient. Use wind
  as a manual judgment call for extreme events, not as an automatic skip.
- *Fix waste immediately.* During mowing season, check for tilted heads, blocked
  spray, overspray onto pavement, misting, leaking valves, or runoff after each
  mowing. Repair before the next assigned watering day.
- *Prioritize trees over turf if tradeoffs appear.* Newly planted and establishing
  trees are harder to replace than Kentucky bluegrass. Accept temporary summer
  turf stress before compromising Honeylocust, Serviceberry, Japanese Maple, or
  Crabapple establishment.
- *Do not start new high-water projects casually.* New sod, seed, and major new
  plantings should wait unless the current SACWSD rules/exemptions and monthly
  water budget can support establishment watering.

// ── Drip System ───────────────────────────────────────────────
== Drip System

All trees and shrubs except the Silver Maples and Skyline Honeylocust are on drip
irrigation. All drip zones share a single schedule — frequency and run time apply
uniformly across every zone. *Emitter output rate and count at each plant are the
only per-plant adjustments available.* Plant-specific watering guidance throughout
this document is expressed in terms of emitter configuration, not schedule frequency.

Outside drought restrictions, early morning (5–7 am) is still the preferred drip
window. During the 2026 program, the legal Wednesday/Saturday assignment is the
first constraint. Keep saturation skips and rain skips enabled, keep Wind Skip off
during restrictions, and keep Smart Cycle active so clay has time to absorb each
pulse.

=== Recommended Schedule

#table(
  columns: (1.2fr, 1fr, 4fr),
  fill: tbl-fill,
  stroke: tbl-stroke,
  align: (left, left, left),

  tbl-header-text[Period],
  tbl-header-text[Interval],
  tbl-header-text[Notes],

  [Active SACWSD drought program], [Wed + Sat only], [Assigned-day schedule with saturation and rain skips; Wind Skip off. Do not add off-day catch-up cycles without an exemption.],
  [April – May outside restrictions], [Every 5–6 days], [Spring ramp-up. Check soil before starting — clay may still hold moisture from the fall pre-freeze deep watering or spring snow events, but do not assume this in a dry year. Observe and adjust.],
  [June – August outside restrictions], [Every 3 days], [Peak demand. Right for the thirstiest drip plant (Japanese Maple at high emitter output). Clay's moisture retention means every-other-day would keep most plants too wet.],
  [September – October outside restrictions], [Every 6–7 days], [Taper down. Fall precipitation contributes; reduce run time as temperatures drop.],
  [November – March], [System off],    [Winter watering done manually. See Winter Watering below.],
)

Current drip duration is about 84 minutes total, evenly distributed across three
zones — approximately 28 minutes per zone. At that runtime, each 2 gph emitter
delivers about 0.93 gallons per assigned-day cycle. This is still much lower than
the original 60-minute baseline, but it is generous for the single-emitter
drought-tolerant plants in clay; use the overwatering signals below as the tuning
check.

Enable Smart Cycle (soak and cycle) — Rachio will split each zone into shorter
pulses with soak time between (e.g., 3 × 7 min), which penetrates clay far better
than a single uninterrupted run. ET/MAD on drip zones will automatically shorten
or skip watering during cool or wet periods.

=== Emitter Configuration

All emitters are 2 gph. Total output per plant is controlled by emitter *count*.
Trees and the Yankee Doodle Lilac use multiple emitters to meet higher demand within
the shared run time. At ~28 min, each 2 gph emitter delivers approximately 0.93 gal
per cycle.

For trees, distribute emitters around the drip line (outer canopy edge), not at the
trunk — feeder roots are at the drip line, and spacing emitters encourages lateral
root spread. Aim for 18–24 inches from the trunk for young trees.

#emitter-config-table

#warning-callout("Japanese Maple — Supplemental Watering Exception")[
  During extended heat waves in July and August (3 or more consecutive days above
  95°F), even the high-output 3 × 2 gph configuration may not fully meet this tree's
  needs in its full-afternoon-sun location. Supplemental hand watering at the drip
  line during these events is appropriate — a slow soak with a hose at the outer
  root zone. This is a documented system constraint, not a general recommendation.
]

#info-callout("Drought-Tolerant Plants — Watching for Too Much Water")[
  At ~0.93 gal/cycle, drought-tolerant plants receive more than strictly necessary
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

Current drought-program configuration:
- *Allowed days:* Wednesday and Saturday, with rain and saturation skips enabled.
- *Wind Skip:* disabled during restrictions because skipped assigned days may create
  a gap of more than one week before the next legal automatic run.
- *Front lawn/tree zones:* worst-case duration about 287 minutes / 4,000 gallons,
  starting at midnight so the entire run finishes before the 10:00 am cutoff.
- *Back yard zones:* about 80 active watering minutes, with the controller window
  scheduled to end at midnight; this keeps the elapsed soak-cycle window after the
  6:00 pm restart and avoids daytime inefficiency.

Keep a monthly eye on actual water use. The front program alone can consume roughly
one-third of the no-surcharge monthly tier in a single worst-case run, before indoor
water, back yard sprinklers, or drip are counted. This makes catch-can calibration,
head repair, and runoff control more important than chasing a perfectly green lawn.

The Silver Maples are fully established (since 2022) and self-sufficient under normal
sprinkler coverage. The Skyline Honeylocust is a second-season plant and may benefit
from supplemental hand watering at its drip line during extended heat waves, as
sprinkler coverage calibrated for established turf may underserve a young tree in
full summer sun. During active restrictions, do this only within current SACWSD
hand-watering allowances or with an approved exemption.


// ── Manual Watering ───────────────────────────────────────────
== Manual Watering (Potted Plants)

Knock Out Roses and White Bacopa are in containers and are watered
manually. Check soil moisture by pressing a finger 2 inches into the mix — water
when dry at that depth. The two morning-sun front pots usually hold moisture longer
than the south-end front pot, which gets most-day sun and may dry faster in summer.
The south-side experimental rose/bacopa planter uses a self-watering insert and
added wicks, so check it separately rather than assuming it follows either front-pot
pattern. Water standard pots thoroughly until it runs freely from drainage holes;
do not allow pots to sit in standing water. For the self-watering experiment, keep
the reservoir functioning but still top-water periodically so salts do not
concentrate in the upper mix.

During active drought restrictions, keep container watering inside current SACWSD
allowances. To stretch intervals, keep the 2026 pot rebuild focused on water-holding
potting mix, a light surface mulch, and working drainage; do not compensate with
standing water in saucers.


// ── Winter Watering ───────────────────────────────────────────
== Winter Watering

The drip system is off from approximately November through March. During this period,
all drip-irrigated trees, evergreens, and shrubs except Dark Knight Bluebeard need
occasional deep watering by hand on any day when temperatures rise above 40°F and
the soil is not frozen, subject to any active water-provider rules. December through February are typically Commerce City's
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
