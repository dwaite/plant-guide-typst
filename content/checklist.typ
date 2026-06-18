// ============================================================
// MONTH-BY-MONTH TASK CHECKLIST
// ============================================================
#import "../template.typ": *

#pagebreak(weak: true)

= Month-by-Month Task Checklist

Use this as the operational schedule. Detailed mixing/rates live in
_Recommended Products & Application Methods_.

#danger-callout("Spring 2026 — Priority Inspection")[
  Inspect Silver Maples and Serviceberry for frost crack/sunscald from winter
  2025–26. Install trunk wrap in October–November 2026.
]

#warning-callout("2026 Nutrition Catch-Up")[
  Resume the normal 2026 program; do not over-correct spring N. Do not skip the
  May micronutrient pass or EDDHA split for Honeylocust/Japanese Maple.
]

#let Y = true
#let N = false

#let task-checklist = (
  "January",
  ("Winter water trees/shrubs on warm days (>40°F)", N),
  ("Check stored rose pots for light moisture", N),
  ("Inspect/repair tree wraps", N),
  ("Order spring supplies", N),

  "February",
  ("Dormant pruning (except lilacs)", N),
  ("Cut ornamental grasses to 4–6 inches", N),
  ("Continue warm-day winter watering", N),
  ("Confirm spring supplies on hand", N),

  "March",
  ("Lawn pre-emergent at forsythia/50°F soil", N),
  ("Bed pre-emergent (Preen constrained plan)", N),
  ("Bluebeard hard cut to 4–6 inches (as buds swell)", N),
  ("Start drip after freeze risk", N),
  ("Pull mulch off crowns; fix winter heave", N),
  ("Hand-pull winter annual weeds", N),

  "April",
  ("Tree/shrub spring N-K pass", N),
  ("Acidifying ammonium sulfate pass (maple/spruce/mugo)", N),
  ("Rose container refresh", N),
  ("Start rose fertilizer cycle (every 3–4 weeks)", N),
  ("Humic/fulvic broadcast to lawn + beds", N),
  ("Compost tea spring pass", N),
  ("Refresh bed mulch (maple to 4-inch ring)", N),
  ("Resume mowing at 2.5–3 inches", N),

  "May",
  ("*May micronutrient pass (highest priority)*", N),
  ("EDDHA iron pass (Honeylocust + Japanese Maple)", N),
  ("Container EDTA iron (monthly May–Aug)", N),
  ("First lawn N pass (granular ammonium sulfate)", N),
  ("Confirm SACWSD assigned days + Wind Skip off", N),
  ("Move potted plants outside after last frost", N),
  ("Begin daylily deadheading", N),

  "June",
  ("Post-bloom lilac pruning (Miss Kim + Yankee Doodle)", N),
  ("Second EDDHA pass (Honeylocust)", N),
  ("Rose feed + monthly container iron", N),
  ("Slow the Flow / catch-can irrigation audit", N),
  ("Wetting-agent pass (lawn + beds)", N),
  ("Second lawn N pass", N),
  ("Begin weekly spruce mite checks", N),

  "July",
  ("Second EDDHA pass (Japanese Maple, early July)", N),
  ("Rose feed + monthly container iron", N),
  ("Heat-wave supplemental watering checks", N),
  ("Check monthly water use against 11,999 gal first tier", N),
  ("Check/clean drip emitters", N),
  ("Stop in-ground fertilizer by mid-July", N),

  "August",
  ("Lawn surface check: debris vs thatch vs overseed prep", N),
  ("Core aerate lawn (late month)", N),
  ("Final rose feed + monthly container iron", N),
  ("Lawn pre-emergent second pass", N),
  ("Rock-bed prodiamine refresh", N),
  ("Plan fall overseed only if establishment watering is allowed", N),
  ("Late-August bindweed escalation (only if winter survey + season response justify)", N),

  "September",
  ("Early Sept lawn liquid N pass", N),
  ("Late Sept lawn liquid N + K pass", N),
  ("Tree/shrub potassium sulfate pass", N),
  ("Overseed only if restrictions/water budget allow establishment", N),
  ("Compost tea fall pass", N),
  ("Reduce drip frequency", N),

  "October",
  ("Late-October lawn winterizer", N),
  ("Install tree trunk wraps before freeze", N),
  ("Protect/store potted plants before hard freeze", N),
  ("*Deep water all plants before ground freeze*", N),
  ("Mulch tender crowns (agastache/penstemon/bluebeard)", N),
  ("Leave grasses/sedum stems for winter structure", N),

  "November",
  ("Final deep watering if soil unfrozen", N),
  ("Winterize drip + sprinkler systems", N),
  ("Apply anti-desiccant to juniper/spruce", N),
  ("Install rabbit guards on young trees", N),
  ("No fertilizer until spring", N),

  "December",
  ("Monthly check of stored pots", N),
  ("Inspect wraps/guards after storms", N),
  ("Avoid traffic on frozen lawn", N),
  ("Plan next-year supplies and updates", N),

  "Ongoing (Any Month)",
  ("Annual sprinkler catch-can calibration", N),
  ("Inspect heads/leaks/overspray after mowing during restrictions", N),
  ("Confirm controller has no off-day catch-up starts", N),
  ("Monitor monthly water use against SACWSD drought tier", N),
  ("Monthly drip-emitter inspection in season", N),
  ("Sharpen mower blades at start + mid-season", N),
  ("Monitor rabbit/mice damage", N),
  ("Refresh mulch to 2–3 inches each spring", N),
)

#{
  let cells = ()
  for item in task-checklist {
    if type(item) == str {
      cells += (table.cell(colspan: 2, fill: cat-cell)[
        #text(weight: "bold", fill: forest, size: 11pt)[#item]
      ],)
    } else {
      let (task, checked) = item
      cells += (table.cell(align: top, text(font: "Symbol", baseline: -0.5pt, sym.ballot)),)
      cells += ([#task],)
    }
  }

  table(
    columns: (16pt, 1fr),
    stroke: 0pt,
    inset: (x: 4pt, y: 5pt),
    ..cells,
  )
}
