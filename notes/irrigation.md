# Irrigation — Reasoning & Decisions

This file captures the reasoning behind irrigation recommendations in the document.
Update it when system changes, new observations, or new plants change the logic.

---

## 2026 South Adams County Water Drought Program

Source checked 2026-06-03:
- SACWSD official alert: `https://www.southadamswaterco.gov/alert_detail.php`
- Commerce City water conservation page: `https://www.c3gov.com/Government/Departments-Divisions/Energy-Equity-and-the-Environment/Water-Sustainability`

South Adams County Water & Sanitation District declared Stage 1 drought restrictions
effective May 13, 2026. For this property's assigned schedule, outdoor irrigation is
limited to Wednesday and Saturday. Watering is not allowed from 10am–6pm, and Monday
watering is prohibited. The residential violation path is warning, then $100, $250,
and $500 for later violations. The drought surcharge is a 20% charge above the normal
rate for water use above 11,999 gallons/month.

This changes the irrigation decision model:
- Legal assigned days and time windows override the original interval-only schedule.
- Rachio weather intelligence is still useful, but only as a way to skip or shorten
  assigned-day watering, not as permission for off-day make-up cycles. Exception:
  Wind Skip is disabled during restrictions because repeated wind skips can remove
  both legal weekly watering windows.
- Water-budget awareness matters: the front sprinkler program's worst-case run is
  ~287 minutes / ~4,000 gallons, so a few unnecessary full runs can push the monthly
  bill into the surcharge tier even before indoor water and other zones are counted.
- Non-schedule changes are higher leverage than adding more water: catch-can audit,
  leak/head repair, wetting-agent pass, mulch maintenance, drought-stress mowing
  practices, and conservative fertilizer timing.

Current controller setup as of this update:
- Rachio adaptive watering with rain and saturation skips, Wind Skip disabled, and
  a 50% soil-depletion trigger.
- Front sprinkler program starts at midnight; worst case ~287 minutes / ~4,000 gal.
- Back sprinkler program runs ~80 active watering minutes; the elapsed controller
  window ends at midnight after starting around 7:30pm, keeping the soak-cycle
  window after the 6pm restart.
- Drip program runs ~84 minutes total, evenly distributed across three zones
  (~28 min/zone), with saturation and rain skips.

Back-yard sprinkler sanity math:
- Reported/measured flow is ~14 gpm. At ~80 active watering minutes, that is
  ~1,120 gal for a full back-yard cycle.
- One inch over ~1,600 sq ft is ~997 gal (1,600 × 0.623 gal). The current full
  cycle therefore applies about 1.12 in over the area if distribution is even.
- Spread across an 80-minute active watering runtime, the composite precipitation
  rate is about 0.84 in/hr. That is a plausible maximum-cycle program to let
  Rachio tune down from, but it should be treated as an average because the two
  zones are interspersed and the heads are a mixed set of fixed sprays, rotors,
  and rotary nozzles.
- Rachio settings: high sun and cool-season grass match the site. Loam is an
  acceptable simplification for controller modeling unless field observations show
  persistent runoff or unusual drying. Fixed spray is only a rough approximation
  for the mixed head set; a catch-can test or zone-by-zone precipitation-rate
  adjustment would be more reliable than changing global settings by guesswork.

---

## Three Irrigation Systems

The property has three physically separate irrigation systems that cannot be
cross-controlled:

1. **Drip system** — all trees and shrubs except Silver Maples and Honeylocust;
   all perennials and grasses. All drip zones share a single controller schedule.

2. **Rachio sprinkler** — Silver Maples and Skyline Honeylocust sit in the center
   of lawn zones. They are watered exclusively by the lawn sprinklers; there are no
   drip emitters at these plants. Rachio ET/MAD is already enabled, handling
   automatic weather-based adjustment.

3. **Manual** — container plantings, including the three front garage Knock Out
   Rose planters, the south-side experimental rose/bacopa planter, the four
   back-patio Veradek long boxes, the full-sun half whiskey barrel, and any
   non-reservoir decorative planters. No automatic system; watered by hand based
   on container-specific moisture checks. The south-side rose/bacopa experiment
   and self-watering raised bed should be treated as separate sub-cases because
   reservoir status affects timing.

---

## Drip Zone Architecture

Drip zones are **geographic** (by yard area), not by plant type. This means a
drought-tolerant native grass and the Emperor Japanese Maple may share the same
drip zone and therefore run on an identical schedule.

This is the fundamental constraint that shapes all drip watering recommendations.
It rules out giving individual plants their own frequency — the only adjustment
available is the emitter output rate (gph) at each plant.

---

## Schedule Decision: Option B

Three approaches were considered for the shared drip schedule:

**Option A** — Remove emitters from drought-tolerant plants entirely; run schedule
only for water-demanding plants.
- Problem: drought-tolerant perennials are in their second establishment season
  (2024 cohort, highest-risk year). Removing water during establishment is a
  meaningful risk even for native, drought-tolerant species.

**Option B** — Set shared schedule for the middle of the demand range; give
Japanese Maple the highest emitter output plus a documented supplemental hand
watering exception for extreme heat events.
- Chosen because: preserves establishment moisture for 2024 cohort; acknowledges
  that Japanese Maple is the most demanding plant and the outlier; keeps all
  other plants within their tolerance range through emitter sizing alone.

**Option C** — Add a dedicated drip zone for high-demand plants, separating them
from drought-tolerant plants.
- Valid long-term option if Japanese Maple continues to need more water than
  Option B provides. Not implemented; more invasive and costly.

**Recommended schedule outside active drought restrictions (Option B):**
- April–May: every 5–6 days (spring ramp-up; check soil before starting — clay may
  retain moisture from the fall pre-freeze watering or spring snow events, but Commerce
  City winters are semi-arid and this cannot be assumed in a dry year)
- June–August: every 3 days (peak demand; calibrated for Japanese Maple at 2 gph)
- September–October: every 6–7 days (fall taper; fall precipitation contributes)
- November–March: system off

**During the 2026 SACWSD drought program:** assigned Wednesday/Saturday watering
replaces the interval targets. Keep saturation and rain skips enabled, but keep
Wind Skip disabled. Do not add off-day make-up watering unless SACWSD grants an
exemption or the current rules explicitly allow the specific hand-watering case.

Wind Skip rationale: normally, wind-based skipping prevents spray drift and waste.
Under a two-day legal schedule, however, a windy Wednesday plus windy Saturday can
leave turf and sprinkler-irrigated trees without automatic irrigation for more than
a week. The resulting catch-up run is longer, less efficient, and raises the risk
of turf loss or expensive re-seeding/sod repair. For this property, wind should be
handled manually for extreme events rather than as an automatic skip condition during
active restrictions.

---

## Time of Day

Outside active restrictions, run the drip system early morning — 5–7 am is the target
start time.

Drip timing is less critical than sprinklers (no foliar wetting, minimal surface
evaporation), but morning still wins for two reasons specific to this setup:
1. Moisture reaches the root zone while plants can use it during peak photosynthesis
   hours, rather than sitting in overnight-saturated clay.
2. Smart Cycle soak-and-cycle sequences need the full morning window to complete
   their pause-and-resume cycles before midday heat. An evening start may not
   finish cycling before temperatures drop.

During the 2026 drought program, legal windows and controller run length are the
primary constraints. The front sprinkler program starts at midnight and finishes
well before 10am. The back yard program is intentionally set to end at midnight,
which keeps the elapsed soak-cycle window after the 6pm restart and avoids daytime
inefficiency.
If seasonal adjustment ever pushes a run past 10am, shorten/split/reposition the
program rather than letting it spill into the restricted window.

---

## Emitter Sizing Rationale

### Hardware baseline

The system was installed with 2 gph emitters throughout. Rather than replacing
emitters with mixed sizes, the approach is:
- Keep all emitters at 2 gph
- Run the current controller program at ~84 min total across three zones (~28 min/zone)
- Scale up emitter *count* on trees and the Yankee Doodle Lilac to meet their
  higher demand within the shared run time

This keeps hardware simple (one emitter type) and gives meaningful tuning levers:
emitter count for plants that need more, and early cap dates for plants that need less.

### Volume math

At the current ~28 min/zone run time (Smart Cycle will split this into shorter
pulses with soak time between — see Smart Cycle note below):

| Configuration | Volume/cycle | Weekly avg (2 assigned days/week) |
|---|---|---|
| 1 × 2 gph | ~0.93 gal | ~1.9 gal |
| 2 × 2 gph | ~1.87 gal | ~3.7 gal |
| 3 × 2 gph | ~2.8 gal | ~5.6 gal |

This remains well below the original ~60 min/zone baseline, which delivered 2
gal/cycle for single-emitter plants and 4 gal/cycle for 2×2 gph trees. The current
28 min/zone volume is a middle ground: enough establishment moisture for the 2024
cohort under the two-day drought schedule, but still generous for the most
drought-tolerant plants in clay.

### Emitter count by plant

| Count | Plants | Notes |
|-------|--------|-------|
| 3 × 2 gph | Emperor Japanese Maple | Highest demand; full afternoon sun; shallow roots; ~2.8 gal/cycle |
| 2–3 × 2 gph | Spring Snow Crabapple, Autumn Brilliance Serviceberry | Establishing trees in full/south sun; 2 minimum, 3 preferred |
| 2 × 2 gph | Yankee Doodle Lilac | Larger establishing shrub; ~1.9 gal/cycle |
| 1 × 2 gph | All others | Single emitter adequate for shrubs, perennials, grasses |

**Miss Kim Lilacs and Daylilies — audit required before runtime changes.** These
were installed in 2022 and may have smaller emitters than the 2024 cohort. Confirm
emitter size and actual soil moisture before changing hardware; a 2 gph emitter at
the current ~28 min/zone runtime delivers ~0.93 gal/cycle, which may already be
adequate for established plants in afternoon shade.

### Multiple emitters: placement matters

For trees with 2–3 emitters, distribute them around the drip line (outer canopy
edge), not clustered at the trunk. Feeder roots are at the drip line. Water at
the trunk concentrates moisture where it does the least good and increases crown
rot risk. For young trees where the canopy is still small, 18–24 inches from the
trunk toward the drip line is a reasonable placement.

Multiple emitters distributed around the root zone also encourage lateral root
spread — important for structural establishment in clay.

### Smart Cycle and clay

With Smart Cycle enabled, a ~28 min scheduled zone run is split into shorter
pulses with soak time between. Total water delivered is the same, but penetration
into clay is significantly better than a single uninterrupted run. This pairing —
shorter-than-original run time + Smart Cycle — outperforms the original 60 min
straight run for actual root-zone delivery in clay.

Under the two-day drought schedule, Smart Cycle is also the runoff-control tool.
The goal is not to force the full model amount onto the property at any cost; the
goal is to get the allowed water into the root zone without pavement runoff,
misting, or lateral flow across hydrophobic clay.

---

## Overwatering Indicators and Run-Time Tuning

Even at ~28 min / 2 gph, drought-tolerant plants may show signs of excess moisture.
The drip stop date is the primary tuning lever — cap emitters earlier if signs appear.
Swapping in a smaller emitter (e.g., 0.5–1 gph saved from the Miss Kim / daylily
audit) is the next option if early capping isn't sufficient.

**What to watch for, by plant:**

- **Autumn Joy Sedum** — clearest early signal in the landscape. Stems flop outward
  in a ring rather than staying upright and compact. If flopping by mid-July, it's
  getting too much water.
- **White Yarrow** — yellow lower leaves followed by flopping stems. Yellow foliage
  mid-season when soil is consistently moist is the tell.
- **Dark Knight Bluebeard** — yellowing leaves despite wet soil, or wilting that
  doesn't recover in cool morning temperatures. The dangerous late-season version is
  crown rot going into winter, which won't be visible until spring.
- **Agastache / Penstemon** — softness or yellowing at the crown base, or stems
  flopping. Both are on raised/amended beds which buffers risk, but persistent wet
  at the crown is what kills them.
- **Wichita Blue Juniper / Mops Mugo Pine** — interior needle yellowing or browning.
  Conifers often look fine until they crash; monitoring soil moisture at the crown in
  June is more reliable than watching foliage. First visible needle symptoms are late.

**Tuning actions (least to most invasive):**
1. Cap the emitter earlier in the season — or immediately mid-season if signs appear
2. Swap to a smaller emitter from spares
3. Remove emitter entirely; hand-water only if needed

---

## Drip Stop Decisions

Most plants run with the normal system fall taper through October, then the system
shuts off for winter.

**Plants that should have emitters capped in September:**
- Dark Knight Bluebeard — late-fall wet clay is a direct kill risk; roots rot if
  waterlogged going into winter
- Daylilies — fully established, in afternoon shade; needs dry fall
- White Yarrow — roots susceptible to crown rot in persistently wet soil
- Agastache Sunset Hyssop — drought-tolerant; dry fall improves overwintering
- Rocky Mountain Penstemon — dry fall is *essential* for clay survival; this is
  the most critical stop date in the landscape
- Autumn Joy Sedum — extended wet conditions cause flopping and reduce quality
- Blonde Ambition Blue Grama — native prairie grass; thrives with minimal water

Northwind Switchgrass continues through October — it is more moisture-tolerant
than the native prairie perennials and benefits from fall moisture for root
development.

---

## Japanese Maple Supplemental Exception

During extended heat waves (3 or more consecutive days above 95°F in July–August),
the every-3-day schedule at 2 gph may not fully meet this tree's needs given:
- Full afternoon sun exposure
- Shallow, fibrous root system that feels drought quickly
- Significant pH stress (preferred 5.5–6.5 vs. actual 7.27) reducing root
  efficiency

Supplemental hand watering at the drip line during these events is a documented
system constraint, not a general recommendation. All other drip plants are
adequately served by emitter sizing alone.

---

## Winter Watering

The drip system is off November through March. Commerce City's driest months are
December–February. Roots continue losing moisture even when plants are fully
dormant. Evergreens are particularly vulnerable given prevailing north and northwest
winds causing ongoing desiccation.

Priority order for winter hand watering (any day above 40°F, soil not frozen):
1. Trees (Silver Maples, Honeylocust, Crabapple, Serviceberry, Japanese Maple)
2. Evergreens (Juniper, Blue Spruce, Mugo Pine)
3. Shrubs (Cotoneaster, Lilacs, Bluebeard)

15–20 minutes with a slow hose at the drip line per plant. Under mulch the soil surface
is not visible, so use time as the primary cue. If runoff appears at the outer edge of
the mulch ring before 15 minutes, move the hose inward and continue.
