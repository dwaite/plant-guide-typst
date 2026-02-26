// ============================================================
// MONTH-BY-MONTH TASK CHECKLIST
// Edit the priority callout and checklist items below.
// ============================================================
#import "../template.typ": *

#pagebreak(weak: true)

// ── Monthly task checklist ───────────────────────────────────
= Month-by-Month Task Checklist

Check off each task as completed. The schedule is based on Commerce City
seasonal averages: last frost \~May 10th and first frost \~October 5th.
Tasks are listed in priority order within each month.

#danger-callout("Spring 2026 — Priority Inspection")[
  Trunk wrap was not applied to young trees for winter 2025–26. Inspect the
  Silver Maples and Autumn Brilliance Serviceberry in early spring for frost
  crack (vertical bark splits, usually on the south or southwest side) and
  sunscald (sunken, discolored bark in the same area). Neither is necessarily
  fatal but should be monitored — affected bark may need light cleaning of
  loose material and the area kept dry. Do not paint or seal. Installing trunk
  wrap before next winter (October–November) is a first-priority task for
  fall 2026.
]

// Helper: shorthand for true/false
#let Y = true
#let N = false

#let task-checklist = (
  // ── January ────────────────────────────────────────────────
  "January",
  ("Winter water all trees and drip-zone shrubs on any day above 40°F (20 min run time)",N),
  ("Check Knock Out Rose and Candytuft storage — barely moist, not dry, not frozen",N),
  ("Inspect tree trunk wraps on Silver Maples — replace if damaged",N),
  ("Review this guide; order spring supplies (chelated iron, potassium sulfate, micronutrients)",N),

  // ── February ────────────────────────────────────────────────
  "February",
  ("Prune Silver Maples while dormant (late Feb before bud break)",N),
  ("Prune all deciduous trees and shrubs (except lilacs) while still dormant",N),
  ("Cut ALL ornamental grasses (Blue Grama, Switchgrass) to 4–6 inches",N),
  ("Continue winter watering on warm days (\>40°F)",N),
  ("Confirm spring supplies on hand",N),

  // ── March ───────────────────────────────────────────────────
  "March",
  ("Apply pre-emergent to lawn (when forsythia blooms / soil at 50°F)",N),
  ("Apply pre-emergent to mulched beds and rock areas",N),
  ("Start drip system if freeze risk has passed",N),
  ("Pull mulch back from plant crowns (prevent crown rot)",N),
  ("Check perennials for winter heave — press crowns back down if lifted",N),
  ("Hand-pull winter annual weeds (hairy bittercress, chickweed) before they set seed",N),

  // ── April ───────────────────────────────────────────────────
  "April",
  ("Apply N-K fertilizer to trees and shrubs (16-0-8 or ammonium sulfate + potassium sulfate)",N),
  ("Apply acidifying fertilizer (Hollytone or ammonium sulfate) to Japanese Maple and Mugo Pine",N),
  ("Refresh potting mix (top third) with fresh Miracle-Gro Moisture Control — work in hydrogel crystals and a small amount of elemental sulfur; replace pea gravel layer with foam packing peanuts if not already done",N),
  ("Refresh mulch to 2–3 inches depth in all beds; use shredded pine bark around Mugo Pine base",N),
  ("Refresh Japanese Maple mulch to 4-inch depth, extended to full drip line",N),
  ("Begin mowing lawn at 2.5–3 inches when bluegrass resumes active growth",N),
  ("Rake and clean debris from crushed rock areas",N),
  ("Second application of pre-emergent in beds if needed",N),

  // ── May ─────────────────────────────────────────────────────
  "May",
  ("*Apply chelated micronutrient package (Fe/Zn/Cu/B/Mn) to ALL in-ground trees, shrubs, and perennials — highest priority task of the year*",N),
  ("Apply EDDHA chelated iron soil drench to Honeylocust and Japanese Maple specifically",N),
  ("Apply liquid chelated iron (EDTA form) to rose containers as monthly drench — continue through August to maintain iron availability as irrigation water raises container pH through summer",N),
  ("First lawn fertilization (N-K formula, \~1 lb N/1,000 sq ft)",N),
  ("Begin sprinkler system regular schedule (1.0–1.5 in/week total)",N),
  ("Move potted plants outside after last frost (\~May 10); plant White Bacopa companions in containers",N),
  ("Monitor for pest emergence (aphids, scale, lilac borer, honeylocust plant bug)",N),
  ("Begin deadheading daylilies as blooms finish",N),

  // ── June ────────────────────────────────────────────────────
  "June",
  ("Prune Miss Kim Lilac immediately after bloom — do not wait past late June",N),
  ("Prune Yankee Doodle Lilac immediately after bloom",N),
  ("Apply second EDDHA iron drench to Honeylocust",N),
  ("Apply monthly chelated iron (EDTA) drench to rose containers",N),
  ("Supplement Japanese Maple drip with hand watering during heat waves — drip schedule alone may be insufficient in full afternoon sun",N),
  ("Begin weekly spider mite inspections on Dwarf Globe Blue Spruce — check branch undersides for fine webbing and stippled needles",N),
  ("Second lawn fertilizer (light N, 0.5 lb N/1,000 sq ft)",N),
  ("Scout all plants for pests — treat early before populations build",N),

  // ── July ────────────────────────────────────────────────────
  "July",
  ("Prune Silver Maples if needed (preferred summer window)",N),
  ("Apply second EDDHA chelated iron drench to Japanese Maple (early July, before peak heat)",N),
  ("Apply monthly chelated iron (EDTA) drench to rose containers",N),
  ("Monitor Japanese Maple for leaf scorch — supplement drip with hand watering during heat waves",N),
  ("Continue weekly spider mite inspections on Dwarf Globe Blue Spruce through August",N),
  ("Check drip emitters — flush or replace any clogged heads",N),
  ("Last fertilizer application before heat break (stop by mid-July)",N),
  ("Monitor lawn for dry spots, summer patch, or spider mite stress",N),

  // ── August ──────────────────────────────────────────────────
  "August",
  ("Core aerate lawn in late August (highest-impact annual lawn task)",N),
  ("Apply monthly chelated iron (EDTA) drench to rose containers — final application of the season",N),
  ("Reduce watering on Bluebeard and Agastache significantly",N),
  ("Apply second pre-emergent to lawn and beds (crabgrass, late-season annual weeds)",N),
  ("Plan fall overseeding of thin lawn areas (seed immediately after aerating)",N),
  ("Apply bindweed herbicide (late August is optimal timing for root-level control)",N),
  ("Note any plants showing summer stress for troubleshooting and correction this fall",N),

  // ── September ───────────────────────────────────────────────
  "September",
  ("Primary fall lawn care: fertilize with N-K formula (\~1.25 lbs N/1,000 sq ft)",N),
  ("Apply potassium sulfate (0-0-50) to all trees and shrubs — critical for winter hardening",N),
  ("Overseed thin lawn areas right after core aeration",N),
  ("Reduce drip irrigation frequency to every 10–14 days",N),
  ("Continue mowing lawn at 2.5–3 inches until growth stops",N),

  // ── October ─────────────────────────────────────────────────
  "October",
  ("Apply K-heavy winterizer fertilizer to lawn (late October)",N),
  ("*Install trunk wraps on Silver Maples AND Autumn Brilliance Serviceberry before first hard freeze — this was missed in 2025–26 and is a first-priority fall task*",N),
  ("Move Knock Out Roses and Candytuft into winter storage before first hard freeze (\<20°F); OR wrap pot bodies in burlap/foam insulation, group against east house wall, and install frost cloth tent over plants and pots",N),
  ("*Deep water ALL trees, shrubs, and perennials before ground freeze — most critical fall task*",N),
  ("Continue mowing until growth stops completely",N),
  ("Mulch tender crowns (Agastache, Penstemon, Bluebeard) with 3–4 in of mulch",N),
  ("Leave ornamental grasses, Sedum seed heads, and dried perennial stems for winter wildlife",N),

  // ── November ────────────────────────────────────────────────
  "November",
  ("Final deep watering of all plants if soil is not yet frozen",N),
  ("Winterize drip irrigation system (blow out or drain)",N),
  ("Winterize sprinkler system (blow out)",N),
  ("Install tree wraps on Silver Maples and Serviceberry if not done in October",N),
  ("Apply anti-desiccant spray (Wilt-Pruf or similar) to Wichita Blue Juniper and Dwarf Globe Blue Spruce in late November — reduces winter desiccation from Commerce City's prevailing north/northwest winter winds",N),
  ("Install wire cylinders around young trees to prevent rabbit damage",N),
  ("Check wrapped outdoor pots on warm days above 40°F — ventilate briefly, replace covering before evening",N),
  ("No fertilizer from this point until March",N),

  // ── December ────────────────────────────────────────────────
  "December",
  ("Check stored potted plants monthly — soil should feel barely damp, not dry or wet",N),
  ("Inspect trunk wraps and rabbit guards on young trees after any storm",N),
  ("Avoid walking on frozen or frost-covered lawn",N),
  ("Plan next year: schedule soil testing (CSU Extension), order any supplies needed",N),
  ("Review this guide and note any changes or additions needed for next season",N),

  // ── Ongoing ─────────────────────────────────────────────────
  "Ongoing (Any Month)",
  ("Annual soil testing: submit a CSU Extension soil test in fall every 1–2 years to track phosphorus decline and potassium improvement", N),
  ("Calibrate sprinklers: perform an annual catch test (tuna can method) to confirm 1.0–1.5 in/week delivery",N),
  ("Inspect drip emitters monthly during irrigation season — clean or replace clogged heads",N),
  ("Sharpen mower blades at season start and mid-season for clean cuts",N),
  ("Rabbit and mice monitoring: check for bark damage on young trees, lawn edge burrows, and browse damage on shrubs",N),
  ("Replace mulch: refresh all mulched beds to 2–3 inches each spring",N),
)

// ── Render the grid ──────────────────────────────────────────
#{
  let cells = ()
  for item in task-checklist {
    if type(item) == str {
      // Category row spanning all 13 columns
      cells += (table.cell(colspan: 2, fill: cat-cell)[
        #text(weight: "bold", fill: forest, size: 11pt)[#item]
      ],)
    } else {
      let (task, checked) = item
      cells += (table.cell(align:top, text(font: "Symbol", baseline: -0.5pt, sym.ballot)),)
      cells += ([#task],)
    }
  }

  table(
    columns: (16pt, 1fr),
    stroke: 0pt,
    inset: (x: 4pt, y: 5pt),
    ..cells
  )
}