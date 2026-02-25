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
- April–May: every 5–6 days (spring ramp-up; clay retains winter moisture)
- June–August: every 3 days (peak demand; calibrated for Japanese Maple at 2 gph)
- September–October: every 6–7 days (fall taper; fall precipitation contributes)
- November–March: system off

---

## Emitter Sizing Rationale

Emitter sizing is the only per-plant variable on a shared schedule.

| Rate   | Plants | Rationale |
|--------|--------|-----------|
| 2 gph  | Japanese Maple | Highest demand; full afternoon sun; shallow roots; pH stress |
| 1 gph  | Crabapple, Serviceberry, Yankee Doodle Lilac | Establishing trees/larger shrub; moderate-high demand |
| 0.5 gph | All others | Drought-tolerant or established; clay moisture retention between cycles is adequate |

The every-3-day summer schedule at 0.5 gph provides roughly 0.17 gph/day average
output. In clay soil with significant moisture retention between cycles, this is
adequate for established and drought-tolerant plants. For establishing plants with
moderate demand (crabapple, serviceberry), 1 gph at the same interval is appropriate.

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

15–20 minutes with a slow hose at the drip line per plant, or until water pools.
