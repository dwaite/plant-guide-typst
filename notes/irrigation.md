# Irrigation — Reasoning & Decisions

This file captures the reasoning behind irrigation recommendations in the document.
Update it when system changes, new observations, or new plants change the logic.

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

3. **Manual** — potted plants (Knock Out Roses, Bacopa, Candytuft). No automatic
   system; watered by hand based on 2-inch soil check.

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

**Recommended schedule (Option B):**
- April–May: every 5–6 days (spring ramp-up; check soil before starting — clay may
  retain moisture from the fall pre-freeze watering or spring snow events, but Commerce
  City winters are semi-arid and this cannot be assumed in a dry year)
- June–August: every 3 days (peak demand; calibrated for Japanese Maple at 2 gph)
- September–October: every 6–7 days (fall taper; fall precipitation contributes)
- November–March: system off

---

## Time of Day

Run the drip system early morning — 5–7 am is the target start time.

Drip timing is less critical than sprinklers (no foliar wetting, minimal surface
evaporation), but morning still wins for two reasons specific to this setup:
1. Moisture reaches the root zone while plants can use it during peak photosynthesis
   hours, rather than sitting in overnight-saturated clay.
2. Smart Cycle soak-and-cycle sequences need the full morning window to complete
   their pause-and-resume cycles before midday heat. An evening start may not
   finish cycling before temperatures drop.

---

## Emitter Sizing Rationale

### Hardware baseline

The system was installed with 2 gph emitters throughout. Rather than replacing
emitters with mixed sizes, the approach is:
- Keep all emitters at 2 gph
- Reduce the shared run time from the original ~60 min to ~20 min
- Scale up emitter *count* on trees and the Yankee Doodle Lilac to meet their
  higher demand within the shorter run time

This keeps hardware simple (one emitter type) and gives meaningful tuning levers:
emitter count for plants that need more, and early cap dates for plants that need less.

### Volume math

At ~20 min run time (Smart Cycle will split this into shorter pulses with soak time
between — see Smart Cycle note below):

| Configuration | Volume/cycle | Weekly avg (every 3 days) |
|---|---|---|
| 1 × 2 gph | 0.67 gal | ~1.6 gal |
| 2 × 2 gph | 1.33 gal | ~3.1 gal |
| 3 × 2 gph | 2.0 gal | ~4.7 gal |

This replaces the previous ~60 min baseline, which delivered 2 gal/cycle for
single-emitter plants and 4 gal/cycle for 2×2 gph trees. The reduced volumes
are more appropriate; clay moisture retention between cycles was compensating
for the excess.

### Emitter count by plant

| Count | Plants | Notes |
|-------|--------|-------|
| 3 × 2 gph | Emperor Japanese Maple | Highest demand; full afternoon sun; shallow roots; maintains ~2 gal/cycle |
| 2–3 × 2 gph | Spring Snow Crabapple, Autumn Brilliance Serviceberry | Establishing trees in full/south sun; 2 minimum, 3 preferred |
| 2 × 2 gph | Yankee Doodle Lilac | Larger establishing shrub |
| 1 × 2 gph | All others | Single emitter adequate for shrubs, perennials, grasses |

**Miss Kim Lilacs and Daylilies — audit required before reducing run time.** These
were installed in 2022 and may have smaller emitters than the 2024 cohort. Confirm
emitter size before reducing run time. If smaller than 2 gph, swap to 2 gph so
that the reduced run time (~20 min) still delivers ~0.67 gal/cycle — appropriate
for established plants in afternoon shade.

### Multiple emitters: placement matters

For trees with 2–3 emitters, distribute them around the drip line (outer canopy
edge), not clustered at the trunk. Feeder roots are at the drip line. Water at
the trunk concentrates moisture where it does the least good and increases crown
rot risk. For young trees where the canopy is still small, 18–24 inches from the
trunk toward the drip line is a reasonable placement.

Multiple emitters distributed around the root zone also encourage lateral root
spread — important for structural establishment in clay.

### Smart Cycle and clay

With Smart Cycle enabled, a ~20 min scheduled run time is split into shorter
pulses (e.g., 3 × 7 min with 30–45 min soak between). Total water delivered is
the same, but penetration into clay is significantly better than a single 20 min
run. This pairing — shorter run time + Smart Cycle — outperforms the original
60 min straight run for actual root-zone delivery in clay.

---

## Overwatering Indicators and Run-Time Tuning

Even at ~20 min / 2 gph, drought-tolerant plants may show signs of excess moisture.
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
