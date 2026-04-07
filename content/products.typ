// ============================================================
// RECOMMENDED PRODUCTS & APPLICATION METHODS
// Edit when products change or delivery methods are updated.
// Source of truth for product decisions: notes/products.md
// ============================================================
#import "../template.typ": *
#import "generated/reference_data.typ": lawn-n-range-display, lawn-size-sqft, preen-inventory-qty, preen-inventory-unit, preen-status, preen-season-lock, preen-scope

// ── Product entry helper ──────────────────────────────────────
// All field arguments are optional — omit any that don't apply.
//
//   #pe("Short Friendly Name",
//     role:    [Purpose subheading — displayed italic under name],
//     npk:     [21-0-0],           // fertilizers only
//     apply:   [Where and how],
//     timing:  [When to use it],
//     note:    [Important caution — omit if none],
//     sources: [Recommended brands and where to buy])
//
#let pe-field(label, content) = {
  linebreak()
  text(weight: "bold")[#label: ]
  content
}

#let pe(name, role: none, npk: none, apply: none, timing: none, note: none, sources: none) = {
  block(breakable: false, {
    v(0.45em)
    text(size: 10pt, weight: "bold")[#name]
    if role != none {
      linebreak()
      text(style: "italic", fill: forest-mid, size: 0.95em)[#role]
    }
    if npk     != none { pe-field("NPK",      npk)    }
    if apply   != none { pe-field("Apply to", apply)  }
    if timing  != none { pe-field("When",     timing) }
    if note    != none { pe-field("Note",     note)   }
    if sources != none {
      v(0.2em)
      text(size: 0.88em, fill: rgb("#444444"))[#sources]
    }
  })
}

#pagebreak(weak: true)
= Recommended Products & Application Methods

All products are chosen to satisfy the high-phosphorus soil constraint: zero or
minimal P additions to any in-ground plant. See the _Soil Profile & Nutrition_
section for the nutrient context driving these choices.

Lawn reference baseline for this guide: #lawn-size-sqft sq ft with an annual
fall-weighted nitrogen target range of #lawn-n-range-display lb N/1,000 sq ft.

#info-callout("Shared Handling Rules")[
  - Use label rates and timing.
  - Use the bucket drench method for root-zone products.
  - Water in granular and wetting-agent applications.
  - Apply EDDHA iron, herbicides, oils/soaps/fungicides, and anti-desiccant solo.
]

#v(0.8em)

== Fertilizers & Nutrients

=== Core Lawn Nutrition

#pe("Granular Ammonium Sulfate",
  role:    [Spring and Early Summer Lawn Nitrogen],
  npk:     [21-0-0],
  apply:   [Lawn — broadcast spreader; water in after application.],
  timing:  [May (\~0.75–1.0 lb N/1,000 sq ft); June (0.5 lb N/1,000 sq ft).],
  note:    [Also available in water-soluble powder form for bucket-drench use on acid-preferring plants — see *Ammonium Sulfate Powder* below. If new lawn granular must be purchased locally, Sta-Green 20-0-0 ammonium sulfate is an acceptable zero-P fallback; apply slightly more product than a 21-0-0 material to hit the same N target.],
  sources: [2026 season: use existing Yard Mastery Flagship 24-0-6 and Scotts Green Max 27-0-2 inventory for the spring lawn N passes instead of buying a new granular ammonium sulfate product. Local fallback if restocking becomes necessary: Sta-Green 20-0-0 ammonium sulfate at Lowe's.])

#pe("Liquid Urea-Ammonium Nitrate",
  role:    [Fall Lawn Nitrogen — Two-Pass Spoon-Feeding],
  npk:     [28-0-0],
  apply:   [Lawn — hose-end sprayer; water in after each pass.],
  timing:  [*Early September:* \~0.5 lb N/1,000 sq ft — before or just after core aeration. *Late September:* \~0.5 lb N/1,000 sq ft combined with liquid potassium (0-0-25) — replaces the separate granular K broadcast for the lawn.],
  note:    [*Fallback:* If either September liquid pass is missed, use the *Slow-Release Granular Urea* entry below instead.],
  sources: [2026 season: use existing Simple Lawn Solutions 27-0-0 clearance inventory for the fall liquid N role.])

#pe("Liquid Potassium",
  role:    [Late-September Lawn Potassium — Paired with Fall Liquid N],
  npk:     [0-0-25],
  apply:   [Lawn — mix with the late-September liquid N pass in the hose-end sprayer.],
  timing:  [Late September only.],
  note:    [This replaces a separate granular K broadcast for the lawn. Trees and shrubs still use granular potassium sulfate instead.],
  sources: [Deferred purchase: use a 0-0-25 class liquid potassium product when the late-September pass approaches.])

#pe("Slow-Release Granular Urea",
  role:    [Fallback Lawn Nitrogen if a September Liquid Pass Is Missed],
  apply:   [Lawn — broadcast spreader; water in after application.],
  timing:  [September fallback only, at 1.0–1.25 lb N/1,000 sq ft.],
  note:    [Use only if the planned liquid fall N sequence is disrupted. Keep one bag on hand each fall rather than treating it as a routine program product.],
  sources: [Deferred fallback product: sulfur- or polymer-coated granular urea.])

#pe("Lawn Winterizer",
  role:    [Late-Season Nitrogen and Potassium for Winter Hardening],
  npk:     [32-0-10],
  apply:   [Lawn — broadcast spreader; water in after application.],
  timing:  [Late October; \~0.5 lb N/1,000 sq ft.],
  note:    [Winterizer already contains potassium — no separate October K₂SO₄ pass needed for the lawn. The September potassium sulfate pass (trees and shrubs) covers the main in-ground K supplementation for the season.],
  sources: [Deferred fall purchase: choose a K-containing winterizer when fall inventory appears.])

#pe("Growth Regulator",
  role:    [Reduces Mowing Frequency 30–50% Without Harming Turf],
  apply:   [Lawn — hose-end or pump sprayer at label rate. Slight temporary darkening of turf colour is normal.],
  timing:  [Early June, after turf has been mowed 2–3 times and is actively growing. Reapply every 4–6 weeks through August as needed.],
  note:    [Do not apply during drought stress or within 6 weeks of fall overseeding.],
  sources: [Deferred optional product: trinexapac-ethyl class growth regulator only if the mowing-reduction program is worth running this season.])

=== Core In-Ground Nutrition

#pe("Liquid N-K Fertilizer",
  role:    [Spring Nitrogen and Potassium for Trees and Shrubs],
  npk:     [15-0-15],
  apply:   [Skyline Honeylocust, both lilacs, and Dark Knight Bluebeard — bucket drench at the drip line. Wichita Blue Juniper is optional at low rate only. Do not use this product for Crabapple, Serviceberry, Japanese Maple, Blue Spruce, Mugo Pine, or Cotoneaster.],
  timing:  [April spring pass; can be combined with LESCO Chelated Micro Mix during the May micronutrient pass where the plant program calls for both.],
  sources: [2026 product: Superior 15-0-15 liquid concentrate.])

#pe("Ammonium Sulfate Powder",
  role:    [Acidifying Nitrogen for Japanese Maple, Blue Spruce, and Mugo Pine],
  npk:     [21-0-0],
  apply:   [Japanese Maple, Dwarf Globe Blue Spruce, and Mops Mugo Pine — bucket drench at drip line.],
  timing:  [Early spring (April), every 1–2 years.],
  note:    [Must be water-soluble powder — granular ammonium sulfate does not dissolve adequately for bucket use. Holly-tone 4-3-4 is a convenience alternative but contains P; acceptable for these three plants only where no zero-P acidifying option exists.],
  sources: [2026 product: Greenway Biotech water-soluble ammonium sulfate 21-0-0 powder.])

#pe("Granular Potassium Sulfate",
  role:    [Fall Potassium Hardening for Trees and Shrubs],
  npk:     [0-0-50],
  apply:   [All in-ground trees and shrubs — pull mulch back, hand broadcast to drip line, water in, replace mulch.],
  timing:  [September — trees and shrubs only. Lawn potassium is provided by liquid 0-0-25 combined with the late-September N pass; no separate granular lawn K pass needed.],
  note:    [Use potassium sulfate (K₂SO₄) specifically — not muriate of potash (KCl), which can harm plants if over-applied.],
  sources: [Deferred fall purchase: generic granular 0-0-50 potassium sulfate.])

=== Micronutrient and pH Correction

#pe("Chelated Micronutrient Blend",
  role:    [Annual Fe, Mn, Zn, Cu, Mg, S, Mo Correction — Highest-Priority Annual Task],
  apply:   [All in-ground trees, shrubs, and perennials — bucket drench; combine with liquid N-K for the May pass.],
  timing:  [May only.],
  note:    [The iron in this blend is not EDDHA-form and may not be fully available at pH 7.27 for the most chlorosis-sensitive plants. Honeylocust and Japanese Maple receive a separate *EDDHA Chelated Iron* drench in addition to this blend — not instead of it.],
  sources: [2026 product: LESCO Chelated Micro Mix.])

#pe("EDDHA Chelated Iron",
  role:    [pH-Stable Iron Correction at pH 7.27],
  apply:   [Honeylocust and Japanese Maple — bucket drench only.],
  timing:  [May (both plants); June (Honeylocust only); early July (Japanese Maple only).],
  note:    [EDDHA is the only chelated iron form that remains plant-available above pH 7.0. EDTA and other chelates precipitate out above pH 6.5 and are ineffective in this soil. Applied *in addition to* the chelated micronutrient blend — the blend covers all plants, while EDDHA iron provides targeted supplemental iron for the two most chlorosis-prone plants.],
  sources: [2026 online fallback: Monterey Sequestar Iron 6% 3-0-0 (EDDHA-based). Ferrilene or Sequestrene 138 remain equivalent alternatives if sourced cleanly.])

#pe("EDTA Chelated Iron",
  role:    [Monthly Iron for Knock Out Rose Containers],
  apply:   [Knock Out Rose containers only — watering can drench into container soil.],
  timing:  [Monthly May–August.],
  note:    [EDTA iron is effective only at lower pH. Not suitable for in-ground soil at pH 7.27 — use EDDHA iron for all in-ground plants.],
  sources: [2026 season: use existing Liquid Ironite provisionally for container iron support; defer buying a separate container iron bottle unless the pots actually need more support.])

#pe("Elemental Sulfur",
  role:    [Gradual pH Reduction for Acid-Preferring Plants and Containers],
  apply:   [Japanese Maple and Mugo Pine — broadcast at drip line, water in. Knock Out Roses — work into top layer of potting mix at spring container refresh.],
  timing:  [Spring.],
  sources: [2026 season: use existing Earth Science elemental sulfur inventory.])

=== Container Refresh & Nutrition

#pe("Rose Container Fertilizer",
  role:    [Balanced Feed for Repeat-Blooming Potted Roses],
  npk:     [12-4-16],
  apply:   [Knock Out Rose containers — mix per label into a watering can, drench container soil.],
  timing:  [Every 3–4 weeks from April through mid-August (6–7 applications total). Stop 6 weeks before expected first frost.],
  sources: [Jack's Classic Rose FeED 12-4-16 (water-soluble powder). Amazon and specialty garden centers.])

#pe("Mycorrhizal Inoculant",
  role:    [Root-Colonizing Fungi for Spring Container Refresh],
  apply:   [Knock Out Rose containers and shared Bacopa container — blend granular inoculant into refreshed potting mix at spring refresh.],
  timing:  [Spring container refresh only.],
  note:    [For this guide, use this as a container-refresh input. Existing in-ground plants are not a target use case in current operations.],
  sources: [2026 product: DYNOMYCO mycorrhizal inoculant, 100 g pouch.])

=== Soil Conditioners & Biology (Non-Fertilizer Support)

#pe("Humic Acid",
  role:    [Spring Soil Biology and Nutrient Uptake Primer],
  apply:   [All beds and lawn — hose-end sprayer broadcast.],
  timing:  [April.],
  note:    [Not a pH amendment — does not lower soil pH.],
  sources: [2026 season: use existing MicrGreen 0-0-2 and RGS 0-0-1 inventory first for the humic / kelp support role.])

#pe("Compost Tea",
  role:    [Living Soil Microbial Inoculant],
  apply:   [Lawn — hose-end broadcast. Tree/shrub drip lines — bucket drench. Buy and apply same day.],
  timing:  [Spring (April/May); fall (September, after aeration and compost topdressing).],
  note:    [Do not apply in summer — clay surface temperatures kill microbes before establishment. Never mix with chemical fertilizers.],
  sources: [EcoCycle Microbe Brew — local Boulder, CO product. ecocycle.org.])

#pe("Wetting Agent",
  role:    [Summer Irrigation Efficiency — Reduces Clay Hydrophobia],
  apply:   [Lawn and all beds (\~6,000 sq ft) — Revive liquid concentrate in Chapin G362D hose-end sprayer. Follow immediately with irrigation.],
  timing:  [Late June to mid-July; second application in early August in hot, dry years.],
  note:    [Use liquid concentrate only — not granular Revive, which is a 5-1-1 fertilizer containing phosphorus (incompatible with this property's high-P soil). Selection rule: use irrigation-water chemistry first (bicarbonate/carbonate/RSC risk) to decide whether a carbonate-focused track is warranted; otherwise optimize wetting-agent choice by seasonal cost and reapplication cadence. Wetting agents do not replace the no-P + EDDHA + micronutrient soil strategy.],
  sources: [Revive liquid concentrate (1-gal jug, \~\$25, covers 4,000 sq ft — approximately 1.5 jugs per application). Colorado Ace Hardware and Home Depot (Colorado-specific retail — confirm spring stock).])

#pe("Anti-Desiccant",
  role:    [Winter Moisture Protection for Evergreen Foliage],
  apply:   [Wichita Blue Juniper and Dwarf Globe Blue Spruce — M12 foliar spray.],
  timing:  [Late November only, after temperatures are consistently below 40°F but before the hardest freezes.],
  sources: [Bonide Wilt-Stop or Wilt-Pruf concentrate. Ace Hardware, Home Depot, and garden centers.])

#v(0.8em)
== Weed Control

#info-callout("2026 Reduced-Product Plan + Winter Survey Gate")[
  Use the consolidated post-emergent stack below for 2026 to minimize SKUs. After your winter weed survey, adjust only if a specific pressure pattern justifies an extra active ingredient (for example, persistent bindweed patches that do not respond to the default track).
]

#pe("Granular Pre-Emergent",
  role:    [Crabgrass and Annual Weed Prevention — Lawn],
  apply:   [Lawn — broadcast spreader; water in after application.],
  timing:  [Late March at forsythia bloom (soil at 50°F); second pass August.],
  note:    [Do not apply within 8–12 weeks of overseeding.],
  sources: [Scotts Halts (pendimethalin) or prodiamine granular. Home Depot and Ace Hardware.])

#pe("Bed Pre-Emergent (2026 Constrained Plan)",
  role:    [Weed Seed Prevention in Mulched Beds and Rock Areas],
  apply:   [*Spring:* Preen Garden Weed Preventer granules broadcast across all beds. Mulch beds — water in normally. Rock beds — follow with thorough hose flush-through to push product past rocks to soil surface. If refreshing mulch, add mulch first, then apply Preen on top, then water in. *Late July/August refresh:* Liquid prodiamine concentrate via M12 sprayer on rock beds only — prodiamine's longer residual (\~3–5 months) carries through fall and into winter.],
  timing:  [Spring at forsythia bloom (soil at 50°F); late July/August refresh on rock beds only.],
  note:    [Status: #preen-status for #preen-season-lock because ~#preen-inventory-qty #preen-inventory-unit is already on hand for #preen-scope. Preen (trifluralin) and prodiamine are both dinitroaniline root-inhibitor pre-emergents (Group 3 mode-of-action context) — do not apply both to the same area in the same pass. Follow current label site restrictions and watering-in directions.],
  sources: [Spring: Preen Garden Weed Preventer (granular trifluralin). Home Depot and Ace Hardware. August refresh: Prodiamine liquid concentrate. Garden centers and online.])

#pe("Lawn Post-Emergent Combo Herbicide",
  role:    [Single-SKU Lawn Broadleaf + Crabgrass Post-Emergent Control],
  apply:   [Lawn — hose-end or pump sprayer per label. Do not mow 2 days before or after application.],
  timing:  [May or September when weeds are actively growing. For crabgrass, target young plants (2–4 tillers). Do not apply above 85°F or when wind exceeds 10 mph.],
  note:    [Use a lawn-labeled combo with 2,4-D + dicamba + quinclorac (with or without sulfentrazone) to replace separate broadleaf and crabgrass post-emergent products.],
  sources: [Examples: Spectracide Weed Stop for Lawns + Crabgrass Killer or equivalent combo products. Home Depot and Ace Hardware.])

#pe("Bindweed Escalation Herbicide",
  role:    [Optional Add-On for Persistent Bindweed After Survey],
  apply:   [Bindweed foliage only — M12 targeted spot spray.],
  timing:  [Late August preferred — roots are most vulnerable before fall dormancy.],
  note:    [Default reduced stack uses glyphosate spot treatment first. Add this product only if winter survey plus 2026 response shows persistent bindweed requiring a second mode of action.],
  sources: [Triclopyr concentrate: Ortho Brush-B-Gon or similar. Home Depot and Ace Hardware.])

#pe("Grass-in-Beds Herbicide",
  role:    [Selectively Kills Lawn Grass Encroaching into Beds],
  apply:   [Grassy weeds in planting beds — M12 sprayer on grass foliage only; does not harm broadleaf plants.],
  timing:  [When grass is actively growing and encroaching.],
  sources: [Fluazifop: Ornamec or Grass-B-Gon. Garden centers and online.])

#pe("Non-Selective Herbicide",
  role:    [Total Vegetation Kill in Crushed Rock Areas Only],
  apply:   [Crushed rock areas only — targeted spot spray. Never use in planting beds or near desirable plants.],
  timing:  [As needed for active weeds.],
  note:    [Glyphosate is the default reduced-stack non-selective tool and first-line bindweed spot treatment outside lawn areas. Horticultural vinegar is contact-only (faster knockdown, may need repeat applications).],
  sources: [Glyphosate: Roundup or generic. Horticultural vinegar: 20–30% acetic acid (not household vinegar). Home Depot and Ace Hardware.])

#v(0.8em)
== Pest & Disease

#warning-callout("Pesticide Approach")[
  Broad-spectrum pesticides (pyrethroids, neonicotinoids, organophosphates) can
  harm hummingbirds, butterflies, bees, and insect-feeding birds. Use the targeted
  treatments listed below, applied at dawn or dusk. Systemic neonicotinoids should
  be avoided entirely. All spray products below are applied with the Milwaukee M12
  handheld sprayer unless otherwise noted.
]

=== Common / Keep On Hand

#pe("Insecticidal Soap",
  role:    [Contact Kill of Soft-Bodied Pests — Aphids, Mites, Whitefly],
  apply:   [Affected foliage — M12 spray at dawn/dusk; repeat every 5–7 days as needed.],
  timing:  [As needed during growing season.],
  sources: [Garden Safe or Bonide Insecticidal Soap. Ace Hardware, Home Depot, and garden centers.])

#pe("Horticultural Oil",
  role:    [Smothers Overwintering Insects, Mite Eggs, and Scale on Woody Plants],
  apply:   [Woody plants — M12 spray. Do not mix with sulfur products or apply above 85°F.],
  timing:  [Primary: early spring before bud break (dormant application). Secondary: growing season as needed.],
  sources: [Bonide All Seasons Oil or similar horticultural oil. Ace Hardware and garden centers.])

#pe("Potassium Bicarbonate",
  role:    [Low-Toxicity Contact Fungicide for Powdery Mildew],
  apply:   [Affected foliage — M12 sprayer. Primarily lilacs in late spring and early summer.],
  timing:  [At first sign of white powdery coating.],
  sources: [Milstop or GreenCure. Garden centers and online.])

=== As-Needed

#pe("Neem Oil",
  role:    [Multi-Action Fungicide, Miticide, and Insecticide],
  apply:   [Affected foliage — M12 spray at dawn/dusk. Do not apply above 90°F.],
  timing:  [As needed; optional preventive rotation for roses starting in May.],
  sources: [Bonide Neem Oil. Ace Hardware, Home Depot, and garden centers.])

#pe("Bt — Bacillus thuringiensis",
  role:    [Biological Caterpillar and Larva Control — Safe for Pollinators],
  apply:   [Affected foliage — M12 sprayer when larvae are young and actively feeding.],
  timing:  [As needed during growing season.],
  sources: [Bonide Thuricide or similar Bt-k formulation. Ace Hardware, Home Depot, and garden centers.])

#pe("Spinosad",
  role:    [Biological Control — Caterpillars, Sawfly, Leaf Miners, Thrips],
  apply:   [Affected foliage — M12 sprayer at dawn or dusk.],
  timing:  [As needed.],
  sources: [Captain Jack's Deadbug Brew or similar. Ace Hardware, Home Depot, and garden centers.])

#pe("Copper Fungicide",
  role:    [Fire Blight, Powdery Mildew, and Rust Prevention and Control],
  apply:   [Affected plants — M12 spray.],
  timing:  [Preventively in early spring or at first symptom.],
  sources: [Bonide Copper Fungicide or Liqui-Cop. Ace Hardware and garden centers.])

#pe("Rose Fungicide",
  role:    [Systemic Black Spot Prevention and Control for Knock Out Roses],
  apply:   [Knock Out Rose foliage — M12 spray on a 7–14 day preventive rotation.],
  timing:  [Preventively starting in May through the growing season.],
  sources: [Myclobutanil (Spectracide Immunox) or tebuconazole (Bayer Disease Control). Home Depot, Ace Hardware, and garden centers.])

#pe("Diplodia Tip Blight Fungicide",
  role:    [Targeted Treatment for Mugo Pine Shoot Dieback],
  apply:   [Mops Mugo Pine — M12 sprayer during candle emergence.],
  timing:  [Spring only, and only if Diplodia has been observed in prior seasons — not a preventive annual application.],
  sources: [Cleary's 3336 or similar thiophanate-methyl. Garden centers and online; may require special order.])

#v(0.8em)
== Application Methods

Use these default methods:
- *Granular products* — broadcast spreader (lawn) or hand-broadcast to drip line (beds); water in.
- *Soil drenches* — bucket at drip line; May combined pass is 15-0-15 + chelated micros.
- *Bed sprays* — Milwaukee M12 for surface coverage.
- *Lawn liquids* — Chapin hose-end sprayer.
- *Rock areas* — broadcast over rock surface and water in.

#v(0.8em)
== Tank Mixing Rules

#info-callout("Safe to combine in one bucket")[
  - *15-0-15 N-K + LESCO Chelated Micro Mix* — standard May combined drip-line pass
  - *15-0-15 N-K + humic acid* — compatible
  - *Humic acid + LESCO Chelated Micro Mix* — compatible
]

#danger-callout("Apply solo — never mix these")[
  - *EDDHA iron* (Ferrilene/Sequestrene 138)
  - *Herbicides* (2,4-D/dicamba/quinclorac combos, glyphosate, optional triclopyr)
  - *Compost tea* (EcoCycle Microbe Brew) — chemical fertilizers kill the living microbes
  - *Anti-desiccant* (Wilt-Pruf/Bonide Wilt-Stop)
  - *Horticultural oil* — do not mix with sulfur-based products
  - *Insecticidal soap / neem oil / copper fungicide / other pest products*
]
