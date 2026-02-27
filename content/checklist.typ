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
  ("Review this guide; order spring supplies — see _Products & Delivery_ in notes. Key items to order online: Ferrilene/Sequestrene 138 EDDHA iron, LESCO Chelated Micro Mix (SiteOne), Simple Lawn Solutions 15-0-15",N),

  // ── February ────────────────────────────────────────────────
  "February",
  ("Prune Silver Maples while dormant (late Feb before bud break)",N),
  ("Prune all deciduous trees and shrubs (except lilacs) while still dormant",N),
  ("Cut ALL ornamental grasses (Blue Grama, Switchgrass) to 4–6 inches",N),
  ("Continue winter watering on warm days (\>40°F)",N),
  ("Confirm spring supplies on hand",N),

  // ── March ───────────────────────────────────────────────────
  "March",
  ("Apply pre-emergent to lawn — granular pendimethalin (Scotts Halts) at forsythia bloom / soil 50°F",N),
  ("Apply pre-emergent to mulched beds and rock areas — liquid pre-emergent via M12 sprayer",N),
  ("Start drip system if freeze risk has passed",N),
  ("Pull mulch back from plant crowns (prevent crown rot)",N),
  ("Check perennials for winter heave — press crowns back down if lifted",N),
  ("Hand-pull winter annual weeds (hairy bittercress, chickweed) before they set seed",N),

  // ── April ───────────────────────────────────────────────────
  "April",
  ("Apply N-K fertilizer to trees and shrubs — Simple Lawn Solutions 15-0-15 mixed in bucket, slow-pour at each drip line; follow with slow hose soak",N),
  ("Apply acidifying fertilizer to Japanese Maple and Mugo Pine — ammonium sulfate 21-0-0 broadcast at drip line, water in",N),
  ("Knock Out Roses: spring container refresh — top-third mix, hydrogel crystals, elemental sulfur. See _Container Setup_ in plant pages.",N),
  ("Knock Out Roses: replace pea gravel layer with foam packing peanuts (one-time — remove this item once done). See _Container Setup_.",N),
  ("*Knock Out Roses: begin fertilizer schedule — Jack's Classic Rose FeED every 3–4 weeks through mid-August (6–7 applications total)*",N),
  ("Apply humic/fulvic acid to all beds and lawn — liquid concentrate via hose-end sprayer broadcast (spring soil biology window)",N),
  ("Apply compost tea (EcoCycle Microbe Brew) to lawn and tree/shrub drip lines — same-day purchase, apply immediately",N),
  ("Refresh mulch to 2–3 inches depth in all beds; use shredded pine bark around Mugo Pine base",N),
  ("Refresh Japanese Maple mulch to 4-inch depth, extended to full drip line",N),
  ("Begin mowing lawn at 2.5–3 inches when bluegrass resumes active growth",N),
  ("Rake and clean debris from crushed rock areas",N),
  ("Second application of pre-emergent in beds if needed",N),

  // ── May ─────────────────────────────────────────────────────
  "May",
  ("*Apply chelated micronutrient package to ALL in-ground trees, shrubs, and perennials — LESCO Chelated Micro Mix mixed in bucket with 15-0-15 N-K; slow-pour at each drip line, follow with slow hose soak. Highest priority task of the year.*",N),
  ("Apply EDDHA chelated iron soil drench to Honeylocust and Japanese Maple — Ferrilene/Sequestrene 138 dissolved in separate bucket of water; slow-pour at drip line, follow with hose soak. Apply solo — do not mix with other products.",N),
  ("Apply liquid chelated iron (EDTA — Bonide Liquid Iron) to rose containers as monthly drench — continue through August",N),
  ("Knock Out Roses: fertilize with Jack's Classic Rose FeED (~3–4 weeks after April application)",N),
  ("First lawn fertilization — granular ammonium sulfate 21-0-0 via broadcast spreader, 0.75–1.0 lb N/1,000 sq ft; water in after",N),
  ("Begin sprinkler system regular schedule (1.0–1.5 in/week total)",N),
  ("Move potted plants outside after last frost (\~May 10); plant White Bacopa companions in containers",N),
  ("Monitor for pest emergence (aphids, scale, lilac borer, honeylocust plant bug)",N),
  ("Begin deadheading daylilies as blooms finish",N),

  // ── June ────────────────────────────────────────────────────
  "June",
  ("Prune Miss Kim Lilac immediately after bloom — do not wait past late June",N),
  ("Prune Yankee Doodle Lilac immediately after bloom",N),
  ("Apply second EDDHA iron drench to Honeylocust — Ferrilene/Sequestrene 138 in separate bucket, slow-pour at drip line, follow with hose soak. Apply solo.",N),
  ("Apply monthly chelated iron (EDTA — Bonide Liquid Iron) drench to rose containers",N),
  ("Knock Out Roses: fertilize with Jack's Classic Rose FeED (~3–4 weeks after May application)",N),
  ("Supplement Japanese Maple drip with hand watering during heat waves — drip schedule alone may be insufficient in full afternoon sun",N),
  ("Apply Revive Ready Spray to lawn and all beds — attach bottle to hose, follow immediately with irrigation",N),
  ("Begin weekly spider mite inspections on Dwarf Globe Blue Spruce — check branch undersides for fine webbing and stippled needles",N),
  ("Second lawn fertilization — granular ammonium sulfate 21-0-0 via broadcast spreader, 0.5 lb N/1,000 sq ft; water in after",N),
  ("Scout all plants for pests — treat early before populations build",N),

  // ── July ────────────────────────────────────────────────────
  "July",
  ("Prune Silver Maples if needed (preferred summer window)",N),
  ("Apply second EDDHA chelated iron drench to Japanese Maple (early July, before peak heat) — Ferrilene/Sequestrene 138 in separate bucket, slow-pour at drip line, follow with hose soak. Apply solo.",N),
  ("Apply monthly chelated iron (EDTA — Bonide Liquid Iron) drench to rose containers",N),
  ("Knock Out Roses: fertilize with Jack's Classic Rose FeED (~3–4 weeks after June application) — last application no later than mid-July",N),
  ("Monitor Japanese Maple for leaf scorch — supplement drip with hand watering during heat waves",N),
  ("Continue weekly spider mite inspections on Dwarf Globe Blue Spruce through August",N),
  ("Check drip emitters — flush or replace any clogged heads",N),
  ("Stop all fertilizer by mid-July — do not fertilize heat-stressed plants",N),
  ("Monitor lawn for dry spots, summer patch, or spider mite stress",N),

  // ── August ──────────────────────────────────────────────────
  "August",
  ("Core aerate lawn in late August (highest-impact annual lawn task)",N),
  ("Apply monthly chelated iron (EDTA — Bonide Liquid Iron) drench to rose containers — final iron application of the season",N),
  ("Knock Out Roses: final fertilizer application — Jack's Classic Rose FeED, early August only; stop by mid-August (6 weeks before first frost)",N),
  ("Reduce watering on Bluebeard and Agastache significantly",N),
  ("Apply second pre-emergent to lawn — granular pendimethalin (Scotts Halts)",N),
  ("Apply second pre-emergent to beds if needed — liquid via M12",N),
  ("Plan fall overseeding of thin lawn areas (seed immediately after aerating)",N),
  ("Apply bindweed herbicide — triclopyr concentrate (Ortho Brush-B-Gon) spot spray via M12; late August optimal for root-level control",N),
  ("Note any plants showing summer stress for troubleshooting and correction this fall",N),

  // ── September ───────────────────────────────────────────────
  "September",
  ("Primary fall lawn fertilization — slow-release granular N via broadcast spreader, 1.0–1.25 lb N/1,000 sq ft; most important lawn N application of the year",N),
  ("Apply granular potassium sulfate (0-0-50) at drip line of all trees and shrubs — broadcast and water in; critical for winter hardening",N),
  ("Overseed thin lawn areas right after core aeration",N),
  ("Apply compost tea (EcoCycle Microbe Brew) to lawn after topdressing — inoculates fresh compost for faster breakdown before soil cools",N),
  ("Reduce drip irrigation frequency to every 10–14 days",N),
  ("Continue mowing lawn at 2.5–3 inches until growth stops",N),

  // ── October ─────────────────────────────────────────────────
  "October",
  ("Apply K-heavy winterizer fertilizer to lawn (late October) — granular (Scotts WinterGuard or similar), 0.5 lb N/1,000 sq ft; K drives winter root development",N),
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
  ("Apply anti-desiccant spray to Wichita Blue Juniper and Dwarf Globe Blue Spruce in late November — Bonide Wilt-Stop or Wilt-Pruf concentrate via M12 sprayer; apply solo",N),
  ("Install wire cylinders around young trees to prevent rabbit damage",N),
  ("Check wrapped outdoor pots on warm days above 40°F — ventilate briefly, replace covering before evening",N),
  ("No fertilizer from this point until March",N),

  // ── December ────────────────────────────────────────────────
  "December",
  ("Check stored potted plants monthly — soil should feel barely damp, not dry or wet",N),
  ("Inspect trunk wraps and rabbit guards on young trees after any storm",N),
  ("Avoid walking on frozen or frost-covered lawn",N),
  ("Plan next year: schedule soil testing (CSU Extension), order any supplies needed (see January checklist)",N),
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
