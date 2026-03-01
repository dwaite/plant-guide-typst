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

#v(0.8em)

== Fertilizers & Nutrients

#pe("Granular Ammonium Sulfate",
  role:    [Spring and Early Summer Lawn Nitrogen],
  npk:     [21-0-0],
  apply:   [Lawn — broadcast spreader; water in after application.],
  timing:  [May (\~0.75–1.0 lb N/1,000 sq ft); June (0.5 lb N/1,000 sq ft).],
  note:    [Also available in water-soluble powder form for bucket-drench use on acid-preferring plants — see *Ammonium Sulfate Powder* below.],
  sources: [Generic granular ammonium sulfate 21-0-0. Home Depot and Ace Hardware.])

#pe("Liquid Urea-Ammonium Nitrate",
  role:    [Fall Lawn Nitrogen — Two-Pass Spoon-Feeding],
  npk:     [28-0-0],
  apply:   [Lawn — hose-end sprayer; water in after each pass.],
  timing:  [*Early September:* \~0.5 lb N/1,000 sq ft — before or just after core aeration. *Late September:* \~0.5 lb N/1,000 sq ft combined with liquid potassium (0-0-25) — replaces the separate granular K broadcast for the lawn.],
  note:    [*Fallback:* If either pass is missed, apply slow-release granular urea at 1.0–1.25 lb N/1,000 sq ft via broadcast spreader instead. Keep one bag on hand each fall.],
  sources: [Liquid N: Simple Lawn Solutions 28-0-0 or equivalent zero-P liquid N concentrate. Amazon or simplelawnsolutions.com. Liquid K: Simple Lawn Solutions 0-0-25. Amazon. Fallback slow-release granular: sulfur- or polymer-coated urea, Home Depot and Ace Hardware.])

#pe("Lawn Winterizer",
  role:    [Late-Season Nitrogen and Potassium for Winter Hardening],
  npk:     [32-0-10],
  apply:   [Lawn — broadcast spreader; water in after application.],
  timing:  [Late October; \~0.5 lb N/1,000 sq ft.],
  note:    [Winterizer already contains potassium — no separate October K₂SO₄ pass needed for the lawn. The September potassium sulfate pass (trees and shrubs) covers the main in-ground K supplementation for the season.],
  sources: [Scotts Turf Builder WinterGuard or equivalent K-heavy granular winterizer. Home Depot and Ace Hardware.])

#pe("Growth Regulator",
  role:    [Reduces Mowing Frequency 30–50% Without Harming Turf],
  apply:   [Lawn — hose-end or pump sprayer at label rate. Slight temporary darkening of turf colour is normal.],
  timing:  [Early June, after turf has been mowed 2–3 times and is actively growing. Reapply every 4–6 weeks through August as needed.],
  note:    [Do not apply during drought stress or within 6 weeks of fall overseeding.],
  sources: [Primo Maxx (professional concentrate) or PGR-IV Trinexapac 11.3% SC. SiteOne Landscape Supply (call ahead) or online at pestrong.com / intermountainturf.com. Not at Home Depot or Ace.])

#pe("Liquid N-K Fertilizer",
  role:    [Spring Nitrogen and Potassium for Trees and Shrubs],
  npk:     [15-0-15],
  apply:   [All in-ground trees and shrubs — bucket drench at drip line; follow with slow hose soak. Can be combined in the same bucket as chelated micronutrient blend for the May combined pass.],
  timing:  [Early spring; combined with LESCO Chelated Micro Mix in May.],
  sources: [Simple Lawn Solutions 15-0-15 (liquid concentrate; also contains humic acid and kelp). Amazon or simplelawnsolutions.com.])

#pe("Granular Potassium Sulfate",
  role:    [Fall Potassium Hardening for Trees and Shrubs],
  npk:     [0-0-50],
  apply:   [All in-ground trees and shrubs — pull mulch back, hand broadcast to drip line, water in, replace mulch.],
  timing:  [September — trees and shrubs only. Lawn potassium is provided by liquid 0-0-25 combined with the late-September N pass; no separate granular lawn K pass needed.],
  note:    [Use potassium sulfate (K₂SO₄) specifically — not muriate of potash (KCl), which can harm plants if over-applied.],
  sources: [Generic granular 0-0-50 potassium sulfate. Home Depot and Ace Hardware.])

#pe("EDDHA Chelated Iron",
  role:    [pH-Stable Iron Correction at pH 7.27],
  apply:   [Honeylocust and Japanese Maple — bucket drench only; dissolve in 1–2 gal water per plant, pour slowly at drip line, follow with slow hose soak. *Apply solo — never mix with other products.*],
  timing:  [May (both plants); June (Honeylocust only); early July (Japanese Maple only).],
  note:    [EDDHA is the only chelated iron form that remains plant-available above pH 7.0. EDTA and other chelates precipitate out above pH 6.5 and are ineffective in this soil. Applied *in addition to* the chelated micronutrient blend — the blend covers all plants, while EDDHA iron provides targeted supplemental iron for the two most chlorosis-prone plants.],
  sources: [Ferrilene 6% EDDHA or Sequestrene 138 (equivalent products). Amazon, pestrong.com, or intermountainturf.com. Also at SiteOne Landscape Supply (call ahead). Not at Home Depot or Ace.])

#pe("EDTA Chelated Iron",
  role:    [Monthly Iron for Knock Out Rose Containers],
  apply:   [Knock Out Rose containers only — watering can drench into container soil.],
  timing:  [Monthly May–August.],
  note:    [EDTA iron is effective only at lower pH. Not suitable for in-ground soil at pH 7.27 — use EDDHA iron for all in-ground plants.],
  sources: [Bonide Liquid Iron or Southern Ag Chelated Liquid Iron. Ace Hardware, Home Depot, or garden centers.])

#pe("Chelated Micronutrient Blend",
  role:    [Annual Fe, Mn, Zn, Cu, Mg, S, Mo Correction — Highest-Priority Annual Task],
  apply:   [All in-ground trees, shrubs, and perennials — bucket drench at drip line; combine with liquid N-K fertilizer in the same bucket for the May combined pass; follow with slow hose soak.],
  timing:  [May only.],
  note:    [The iron in this blend is not EDDHA-form and may not be fully available at pH 7.27 for the most chlorosis-sensitive plants. Honeylocust and Japanese Maple receive a separate *EDDHA Chelated Iron* drench in addition to this blend — not instead of it.],
  sources: [LESCO Chelated Micro Mix (liquid). SiteOne Landscape Supply (open to public; Denver/Aurora metro — call ahead to confirm stock). Mail-order alternative: Golf Course Lawn Micronutrient Blend (golfcourselawn.store).])

#pe("Ammonium Sulfate Powder",
  role:    [Acidifying Nitrogen for Japanese Maple, Blue Spruce, and Mugo Pine],
  npk:     [21-0-0],
  apply:   [Japanese Maple, Dwarf Globe Blue Spruce, and Mops Mugo Pine — bucket drench at drip line; dissolve powder in 1–2 gal water, pour slowly, follow with slow hose soak. Percolates through mulch without disturbing it.],
  timing:  [Early spring (April), every 1–2 years.],
  note:    [Must be water-soluble powder — granular ammonium sulfate does not dissolve adequately for bucket use. Holly-tone 4-3-4 is a convenience alternative but contains P; acceptable for these three plants only where no zero-P acidifying option exists.],
  sources: [Water-soluble ammonium sulfate 21-0-0 powder. Shop for best price — any horticultural or food-grade soluble formulation is equivalent. Ryan Knorr Lawn Care (ryanknorrlawncare.com) at \~\$2.20/lb is one source.])

#pe("Elemental Sulfur",
  role:    [Gradual pH Reduction for Acid-Preferring Plants and Containers],
  apply:   [Japanese Maple and Mugo Pine — broadcast at drip line, water in. Knock Out Roses — work into top layer of potting mix at spring container refresh.],
  timing:  [Spring.],
  sources: [Generic granular elemental sulfur. Home Depot, Ace Hardware, and garden centers.])

#pe("Rose Container Fertilizer",
  role:    [Balanced Feed for Repeat-Blooming Potted Roses],
  npk:     [12-4-16],
  apply:   [Knock Out Rose containers — mix per label into a watering can, drench container soil.],
  timing:  [Every 3–4 weeks from April through mid-August (6–7 applications total). Stop 6 weeks before expected first frost.],
  sources: [Jack's Classic Rose FeED 12-4-16 (water-soluble powder). Amazon and specialty garden centers.])

#pe("Humic Acid",
  role:    [Spring Soil Biology and Nutrient Uptake Primer],
  apply:   [All beds and lawn — hose-end sprayer broadcast.],
  timing:  [April.],
  note:    [Not a pH amendment — does not lower soil pH.],
  sources: [Simple Lawn Solutions Humic Acid or BioAg TM-7 (liquid concentrate). Amazon.])

#pe("Compost Tea",
  role:    [Living Soil Microbial Inoculant],
  apply:   [Lawn — hose-end sprayer broadcast. Tree and shrub drip lines — bucket slow-pour. Buy same-day only: viable microbial counts drop within 24–48 hours.],
  timing:  [Spring (April/May); fall (September, after aeration and compost topdressing).],
  note:    [Do not apply in summer — clay surface temperatures kill microbes before establishment. Never mix with chemical fertilizers.],
  sources: [EcoCycle Microbe Brew — local Boulder, CO product. ecocycle.org.])

#pe("Mycorrhizal Inoculant",
  role:    [Root-Colonizing Fungi for New Plantings and Container Refresh],
  apply:   [New in-ground plantings — apply granular directly to bare roots or into the planting hole. Containers — mix into fresh potting mix at spring refresh.],
  timing:  [At planting only for new in-ground additions; spring container refresh for Knock Out Roses.],
  note:    [High soil phosphorus limits effectiveness for established in-ground plants — mycorrhizal associations weaken when P is abundant. Most beneficial for future new plantings and containers.],
  sources: [MycoApply Endo/Ecto granular or Rootgrow granular. Garden centers and online (Amazon).])

#pe("Wetting Agent",
  role:    [Summer Irrigation Efficiency — Reduces Clay Hydrophobia],
  apply:   [Lawn and all beds (\~6,000 sq ft) — Revive liquid concentrate in Chapin G362D hose-end sprayer. Follow immediately with irrigation.],
  timing:  [Late June to mid-July; second application in early August in hot, dry years.],
  note:    [Use liquid concentrate only — not granular Revive, which is a 5-1-1 fertilizer containing phosphorus (incompatible with this property's high-P soil). Selection rule: use irrigation-water chemistry first (bicarbonate/carbonate/RSC risk) to decide whether a carbonate-focused track is warranted; otherwise optimize wetting-agent choice by seasonal cost and reapplication cadence. Wetting agents do not replace the no-P + EDDHA + micronutrient soil strategy.],
  sources: [Revive liquid concentrate (1-gal jug, \~\$25, covers 4,000 sq ft — approximately 1.5 jugs per application). Colorado Ace Hardware and Home Depot (Colorado-specific retail — confirm spring stock).])

#pe("Anti-Desiccant",
  role:    [Winter Moisture Protection for Evergreen Foliage],
  apply:   [Wichita Blue Juniper and Dwarf Globe Blue Spruce — M12 sprayer, thorough foliar coat on all foliage. Apply solo — do not mix.],
  timing:  [Late November only, after temperatures are consistently below 40°F but before the hardest freezes.],
  sources: [Bonide Wilt-Stop or Wilt-Pruf concentrate. Ace Hardware, Home Depot, and garden centers.])

#v(0.8em)
== Weed Control

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

#pe("Broadleaf Herbicide",
  role:    [Post-Emergent Broadleaf Weed Kill in Lawn],
  apply:   [Lawn — hose-end or pump sprayer per label. Do not mow 2 days before or after application.],
  timing:  [May or September when weeds are actively growing. Do not apply above 85°F or when wind exceeds 10 mph.],
  sources: [Products containing 2,4-D + dicamba + MCPP: Ortho Weed-B-Gon, Spectracide Weed Stop, or Bayer BioAdvanced. Home Depot and Ace Hardware.])

#pe("Crabgrass Killer",
  role:    [Post-Emergent Kill When Pre-Emergent Was Missed],
  apply:   [Lawn — spot treatment per label.],
  timing:  [When plants are at 2–4 tillers. Large established patches are better managed through aeration and overseeding.],
  sources: [Quinclorac (Drive XLR8 or similar). Garden centers and online.])

#pe("Bindweed Herbicide",
  role:    [Systemic Control of Field Bindweed],
  apply:   [Bindweed foliage only — M12 sprayer, targeted spot treatment. Apply solo — never mix with fertilizers.],
  timing:  [Late August — roots are most vulnerable before fall dormancy; optimal kill rate vs. earlier timing.],
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
  note:    [Glyphosate is systemic (slower, more thorough root kill); horticultural vinegar is contact-only (faster knockdown, may need repeat applications).],
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

#pe("Insecticidal Soap",
  role:    [Contact Kill of Soft-Bodied Pests — Aphids, Mites, Whitefly],
  apply:   [Affected foliage — M12 sprayer on both sides at dawn or dusk. Apply solo. Repeat every 5–7 days as needed.],
  timing:  [As needed during growing season.],
  sources: [Garden Safe or Bonide Insecticidal Soap. Ace Hardware, Home Depot, and garden centers.])

#pe("Neem Oil",
  role:    [Multi-Action Fungicide, Miticide, and Insecticide],
  apply:   [Affected foliage — M12 sprayer at dawn or dusk. Apply solo. Do not apply when temperatures exceed 90°F.],
  timing:  [As needed; preventive rotation for roses starting in May.],
  sources: [Bonide Neem Oil. Ace Hardware, Home Depot, and garden centers.])

#pe("Horticultural Oil",
  role:    [Smothers Overwintering Insects, Mite Eggs, and Scale on Woody Plants],
  apply:   [Woody plants — M12 sprayer. Apply solo — do not mix with sulfur-based products or within 2 weeks of sulfur applications. Do not apply above 85°F.],
  timing:  [Primary: early spring before bud break (dormant application). Secondary: growing season as needed.],
  sources: [Bonide All Seasons Oil or similar horticultural oil. Ace Hardware and garden centers.])

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
  apply:   [Affected plants — M12 sprayer. Apply solo.],
  timing:  [Preventively in early spring or at first symptom.],
  sources: [Bonide Copper Fungicide or Liqui-Cop. Ace Hardware and garden centers.])

#pe("Potassium Bicarbonate",
  role:    [Low-Toxicity Contact Fungicide for Powdery Mildew],
  apply:   [Affected foliage — M12 sprayer. Primarily lilacs in late spring and early summer.],
  timing:  [At first sign of white powdery coating.],
  sources: [Milstop or GreenCure. Garden centers and online.])

#pe("Rose Fungicide",
  role:    [Systemic Black Spot Prevention and Control for Knock Out Roses],
  apply:   [Knock Out Rose foliage — M12 sprayer on a 7–14 day preventive rotation. Apply solo.],
  timing:  [Preventively starting in May through the growing season.],
  sources: [Myclobutanil (Spectracide Immunox) or tebuconazole (Bayer Disease Control). Home Depot, Ace Hardware, and garden centers.])

#pe("Diplodia Tip Blight Fungicide",
  role:    [Targeted Treatment for Mugo Pine Shoot Dieback],
  apply:   [Mops Mugo Pine — M12 sprayer during candle emergence.],
  timing:  [Spring only, and only if Diplodia has been observed in prior seasons — not a preventive annual application.],
  sources: [Cleary's 3336 or similar thiophanate-methyl. Garden centers and online; may require special order.])

#v(0.8em)
== Application Methods

*Granular products* (ammonium sulfate 21-0-0 for lawn, potassium sulfate, elemental
sulfur) — *broadcast spreader or hand broadcast:* Pull mulch back from the plant
base, broadcast granules evenly out to the drip line, water in well, then replace
mulch. For the lawn, use a broadcast spreader for even coverage.

*Soil drench products* (15-0-15 N-K, LESCO Chelated Micro Mix, EDDHA iron,
water-soluble ammonium sulfate for acid-preferring plants) — *bucket + watering can
or slow hose:* Mix product in a bucket of water, pour slowly around the drip line,
then follow with a slow hose soak. More water volume means better penetration into
clay. The May combined pass (15-0-15 + LESCO Micro Mix in one bucket) covers most
trees and shrubs in a single trip. *EDDHA iron must be applied solo in its own
bucket — do not mix.*

*Bed sprays* (liquid pre-emergent, bindweed spot treatment, neem oil, insecticidal
soap, copper fungicide, anti-desiccant) — *Milwaukee M12 2-gallon handheld sprayer:*
Fine spray for surface coverage, not volume. Not the right tool for soil drenches.

*Lawn broadcast liquids* (humic acid, compost tea) — *Chapin G362D hose-end sprayer:*
Adjustable dilution ratios for large-area coverage.

*Crushed rock areas:*
Broadcast granular products over the rock surface and water in — no need to move rock.

#v(0.8em)
== Tank Mixing Rules

#info-callout("Safe to combine in one bucket")[
  - *15-0-15 N-K + LESCO Chelated Micro Mix* — standard May combined drip-line pass
  - *15-0-15 N-K + humic acid* — compatible
  - *Humic acid + LESCO Chelated Micro Mix* — compatible
]

#danger-callout("Apply solo — never mix these")[
  - *EDDHA iron* (Ferrilene/Sequestrene 138) — dedicated bucket drench only for
    dose control and compatibility risk avoidance
  - *Herbicides* (triclopyr, glyphosate, 2,4-D products) — never mix with fertilizers;
    always solo
  - *Compost tea* (EcoCycle Microbe Brew) — chemical fertilizers kill the living microbes
  - *Anti-desiccant* (Wilt-Pruf/Bonide Wilt-Stop) — solo foliar application, November only
  - *Horticultural oil* — do not mix with sulfur-based products or other pesticides
  - *Insecticidal soap / neem oil / copper fungicide / other pest products* — solo;
    risk of phytotoxicity in combination
]
