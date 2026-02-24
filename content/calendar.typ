// ============================================================
// SEASONAL CALENDAR & MONTHLY TASK CHECKLIST
// Edit the calendar table rows and checklist items below.
// ============================================================
#import "../template.typ": *

#pagebreak(weak: true)
= Seasonal Calendar

Commerce City average last frost: \~May 10.
Average first fall frost: \~October 5.
Zone 5b winter minimum temperatures: −15°F to −10°F.

#v(0.6em)

// ── Overview table ───────────────────────────────────────────
#table(
  columns: (0.8fr, 1fr, 4.5fr),
  fill: tbl-fill,
  stroke: tbl-stroke,
  align: (left, left, left),

  tbl-header-text[Month],
  tbl-header-text[Season],
  tbl-header-text[Key Tasks],

  [*January*],   [Winter],
  [Winter water all trees/shrubs on days above 40°F. Check Rose and Candytuft storage. Inspect tree wraps. Review guide; order spring supplies.],

  [*February*],  [Winter],
  [Prune Silver Maples before bud break. Prune deciduous trees and shrubs while dormant (except lilacs). Cut ornamental grasses to 4–6". Continue winter watering on warm days.],

  [*March*],     [Late Winter / Early Spring],
  [Apply pre-emergent (lawn & beds) when forsythia blooms. Start drip system if last freeze has passed. Pull mulch back from plant crowns. Check soil for winter heaving.],

  [*April*],     [Spring],
  [Apply N-K fertilizer to trees and shrubs. Refresh mulch to 2–3". Move potted plants outside after last frost (~May 10). Begin mowing at 2.5–3".],

  [*May*],       [Spring],
  [Apply chelated micronutrient package to ALL in-ground plants — highest priority task. Apply EDDHA iron to Honeylocust and Japanese Maple. Begin first lawn fertilization.],

  [*June*],      [Early Summer],
  [Prune lilacs immediately after bloom — do not delay. Apply second EDDHA iron to Honeylocust. Deep water Japanese Maple 3×/week if afternoon sun stress is visible.],

  [*July*],      [Summer],
  [Prune Silver Maples if needed (July window). Light summer lawn fertilization. Monitor Japanese Maple for leaf scorch. Check drip emitters. Last fertilizer before heat.],

  [*August*],    [Late Summer],
  [Core aerate lawn in late August. Reduce watering on Bluebeard and Agastache. Apply second pre-emergent to lawn and beds. Begin fall overseeding planning.],

  [*September*], [Fall],
  [Primary fall lawn care: N-K fertilizer + potassium sulfate. Overseed after aeration. Apply potassium sulfate to all trees and shrubs. Reduce drip irrigation frequency.],

  [*October*],   [Fall],
  [Apply K-heavy winterizer to lawn (late October). Move potted plants to storage before hard freeze. Deep water all plants before ground freeze. Mulch tender perennials.],

  [*November*],  [Late Fall],
  [Final deep watering before ground freeze. Blow out/drain irrigation system. Install tree wraps on young Silver Maples. Leave grass/perennial seed heads for wildlife.],

  [*December*],  [Winter],
  [Check stored potted plants monthly — barely damp. Inspect trunk wraps and rabbit guards. Avoid walking on frozen lawn. Plan next year soil testing and supply orders.],
)


// ── Monthly task checklist ───────────────────────────────────
#pagebreak(weak: true)
= Month-by-Month Task Checklist

Check off each task as completed. Tasks listed in priority order within each month.

// Helper: checkbox list item
#let check(text) = {
  pad(left: 1.4em)[
    □ #text
  ]
}

// ── January ─────────────────────────────────────────────────
#heading(level: 2)[January]
#check[Winter water all trees and drip-zone shrubs on any day above 40°F (20 min run time)]
#check[Check Knock Out Rose and Candytuft storage — barely moist, not dry, not frozen]
#check[Inspect tree trunk wraps on Silver Maples — replace if damaged]
#check[Review this guide; order spring supplies (chelated iron, potassium sulfate, micronutrients)]

// ── February ────────────────────────────────────────────────
#heading(level: 2)[February]
#check[Prune Silver Maples while dormant (late Feb before bud break)]
#check[Prune all deciduous trees and shrubs (except lilacs) while still dormant]
#check[Cut ALL ornamental grasses (Blue Grama, Switchgrass) to 4–6 inches]
#check[Continue winter watering on warm days (\>40°F)]
#check[Confirm spring supplies on hand]

// ── March ───────────────────────────────────────────────────
#heading(level: 2)[March]
#check[Apply pre-emergent to lawn (when forsythia blooms / soil at 50°F)]
#check[Apply pre-emergent to mulched beds and rock areas]
#check[Start drip system if freeze risk has passed]
#check[Pull mulch back from plant crowns (prevent crown rot)]
#check[Check perennials for winter heave — press crowns back down if lifted]
#check[Hand-pull winter annual weeds (hairy bittercress, chickweed) before they set seed]

// ── April ───────────────────────────────────────────────────
#heading(level: 2)[April]
#check[Apply N-K fertilizer to trees and shrubs (16-0-8 or ammonium sulfate + potassium sulfate)]
#check[Apply acidifying fertilizer (Hollytone or ammonium sulfate) to Japanese Maple]
#check[Refresh mulch to 2–3 inches depth in all beds]
#check[Begin mowing lawn at 2.5–3 inches when bluegrass resumes active growth]
#check[Rake and clean debris from crushed rock areas]
#check[Second application of pre-emergent in beds if needed]

// ── May ─────────────────────────────────────────────────────
#heading(level: 2)[May]
#check[*Apply chelated micronutrient package (Fe/Zn/Cu/B/Mn) to ALL in-ground trees, shrubs, and perennials — highest priority task of the year*]
#check[Apply EDDHA chelated iron soil drench to Honeylocust and Japanese Maple specifically]
#check[First lawn fertilization (N-K formula, \~1 lb N/1,000 sq ft)]
#check[Begin sprinkler system regular schedule (1.0–1.5 in/week total)]
#check[Move potted plants outside after last frost (\~May 10)]
#check[Monitor for pest emergence (aphids, scale, lilac borer, honeylocust plant bug)]
#check[Begin deadheading daylilies as blooms finish]

// ── June ────────────────────────────────────────────────────
#heading(level: 2)[June]
#check[Prune Miss Kim Lilac immediately after bloom — do not wait past late June]
#check[Prune Yankee Doodle Lilac immediately after bloom]
#check[Apply second EDDHA iron drench to Honeylocust]
#check[Deep water Japanese Maple 3× per week if leaf margins show brown/curling]
#check[Second lawn fertilizer (light N, 0.5 lb N/1,000 sq ft)]
#check[Scout all plants for pests — treat early before populations build]

// ── July ────────────────────────────────────────────────────
#heading(level: 2)[July]
#check[Prune Silver Maples if needed (preferred summer window)]
#check[Monitor Japanese Maple for leaf scorch — increase watering if needed]
#check[Check drip emitters — flush or replace any clogged heads]
#check[Last fertilizer application before heat break (stop by mid-July)]
#check[Monitor lawn for dry spots, summer patch, or spider mite stress]

// ── August ──────────────────────────────────────────────────
#heading(level: 2)[August]
#check[Core aerate lawn in late August (highest-impact annual lawn task)]
#check[Reduce watering on Bluebeard and Agastache significantly]
#check[Apply second pre-emergent to lawn and beds (crabgrass, late-season annual weeds)]
#check[Plan fall overseeding of thin lawn areas (seed immediately after aerating)]
#check[Apply bindweed herbicide (late August is optimal timing for root-level control)]
#check[Note any plants showing summer stress for troubleshooting and correction this fall]

// ── September ───────────────────────────────────────────────
#heading(level: 2)[September]
#check[Primary fall lawn care: fertilize with N-K formula (\~1.25 lbs N/1,000 sq ft)]
#check[Apply potassium sulfate (0-0-50) to all trees and shrubs — critical for winter hardening]
#check[Overseed thin lawn areas right after core aeration]
#check[Reduce drip irrigation frequency to every 10–14 days]
#check[Continue mowing lawn at 2.5–3 inches until growth stops]

// ── October ─────────────────────────────────────────────────
#heading(level: 2)[October]
#check[Apply K-heavy winterizer fertilizer to lawn (late October)]
#check[Move Knock Out Roses and Candytuft into winter storage before first hard freeze (\<20°F)]
#check[*Deep water ALL trees, shrubs, and perennials before ground freeze — most critical fall task*]
#check[Continue mowing until growth stops completely]
#check[Mulch tender crowns (Agastache, Penstemon, Bluebeard) with 3–4 in of mulch]
#check[Leave ornamental grasses, Sedum seed heads, and dried perennial stems for winter wildlife]

// ── November ────────────────────────────────────────────────
#heading(level: 2)[November]
#check[Final deep watering of all plants if soil is not yet frozen]
#check[Winterize drip irrigation system (blow out or drain)]
#check[Winterize sprinkler system (blow out)]
#check[Install tree wraps on young Silver Maple trunks (prevent sunscald and frost crack)]
#check[Install wire cylinders around young trees to prevent rabbit damage]
#check[No fertilizer from this point until March]

// ── December ────────────────────────────────────────────────
#heading(level: 2)[December]
#check[Check stored potted plants monthly — soil should feel barely damp, not dry or wet]
#check[Inspect trunk wraps and rabbit guards on young trees after any storm]
#check[Avoid walking on frozen or frost-covered lawn]
#check[Plan next year: schedule soil testing (CSU Extension), order any supplies needed]
#check[Review this guide and note any changes or additions needed for next season]

// ── Ongoing ─────────────────────────────────────────────────
#heading(level: 2)[Ongoing (Any Month)]
#check[Annual soil testing: submit a CSU Extension soil test in fall every 1–2 years to track phosphorus decline and potassium improvement]
#check[Calibrate sprinklers: perform an annual catch test (tuna can method) to confirm 1.0–1.5 in/week delivery]
#check[Inspect drip emitters monthly during irrigation season — clean or replace clogged heads]
#check[Sharpen mower blades at season start and mid-season for clean cuts]
#check[Rabbit and mice monitoring: check for bark damage on young trees, lawn edge burrows, and browse damage on shrubs]
#check[Replace mulch: refresh all mulched beds to 2–3 inches each spring]
