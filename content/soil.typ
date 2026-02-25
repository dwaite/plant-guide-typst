// ============================================================
// SOIL PROFILE & NUTRITION
// Edit nutrient rows and product descriptions below.
// ============================================================
#import "../template.typ": *

#pagebreak(weak: true)
= Soil Profile & Nutrition

All fertilizer decisions in this guide are driven by your CSU soil test results.
The most important actions: avoid all phosphorus additions, supplement nitrogen and
potassium as listed per plant, and apply chelated micronutrients every spring.
Phosphorus is currently HIGH — the correct response is to add none and retest
in 2 years to confirm P levels are declining.

#v(0.8em)

// ── Nutrient table ───────────────────────────────────────────
// Columns: Parameter | Status | Management
#table(
  columns: (1.7fr, 1fr, 3.6fr),
  fill: tbl-fill,
  stroke: tbl-stroke,
  align: (left, left, left),

  // Header
  tbl-header-text[Parameter],
  tbl-header-text[Status],
  tbl-header-text[Management],

  // Rows
  [Soil Texture],   [],               [Clay-dominant with some sand],
  [pH],             [Mildly alkaline],[7.27 — better than typical Commerce City 7.5–8.5; monitor annually],
  [Nitrogen (N)],   text(fill: status-warn, weight: "bold")[⚠ LOW],
                    [Supplement with N-K fertilizers as specified per plant],
  [Phosphorus (P)], text(fill: status-high, weight: "bold")[⚠ HIGH],
                    [*Do NOT add any P fertilizers, bloom boosters, or bone meal.*],
  [Potassium (K)],  text(fill: status-warn, weight: "bold")[⚠ LOW],
                    [Supplement with potassium sulfate (0-0-50) as specified per plant],
  [Sulfur (S)],     text(fill: status-ok)[✓ Optimal],  [No action needed],
  [Calcium (Ca)],   text(fill: status-high)[HIGH],     [Contributes to alkaline pH and micronutrient lockout; no additions needed],
  [Magnesium (Mg)], text(fill: status-ok)[✓ Optimal],  [No action needed],
  [Sodium (Na)],    text(fill: status-ok)[✓ Optimal],  [No action needed],
  [Iron (Fe)],      text(fill: status-warn, weight: "bold")[⚠ VERY LOW],
                    [Annual EDDHA-chelated iron soil drench required for most plants],
  [Zinc (Zn)],      text(fill: status-warn, weight: "bold")[⚠ VERY LOW],
                    [Include in chelated micronutrient package annually],
  [Copper (Cu)],    text(fill: status-warn, weight: "bold")[⚠ VERY LOW],
                    [Include in chelated micronutrient package annually],
  [Boron (B)],      text(fill: status-warn, weight: "bold")[⚠ VERY LOW],
                    [Include in chelated micronutrient package; critical for Serviceberry fruit set],
  [Manganese (Mn)], text(fill: status-warn)[⚠ Low],
                    [Include in chelated micronutrient package annually],
)

#danger-callout("⚠ Critical Soil Rule")[
  Do NOT apply any product containing phosphorus to any in-ground plant in this
  landscape. This includes 10-10-10, 5-10-5, bloom boosters, bone meal,
  superphosphate, and most "starter fertilizers." High soil phosphorus combined
  with alkaline pH chemically locks out iron, zinc, copper, boron, and manganese —
  worsening micronutrient deficiency with every P application. Soil should be retested to verify P levels.
]

#info-callout("Annual Priority Action")[
  Apply a chelated micronutrient package (Fe, Zn, Cu, B, Mn) to all trees, shrubs,
  and most perennials each May. Use EDDHA chelated iron specifically — it remains
  plant-available at pH 7.27 where other iron forms do not. This is the single
  highest-impact annual task for your entire landscape.
]


// ── Recommended Products ─────────────────────────────────────
== Recommended Products

#let product(name, desc) = {
  v(0.3em)
  [*#name:* #desc]
}

#product("Zero-phosphorus lawn fertilizer")[
  Scotts Turf Builder Zero Phosphorus (32-0-6), Lebanon Pro 46-0-0 (urea), or any
  lawn fertilizer with a zero middle number. These are the correct maintenance
  fertilizers for your established sod.
]

#product("Potassium sulfate (0-0-50)")[
  Available at farm supply stores, True Value hardware, or online. Your most
  important supplement for nearly every plant. Use potassium sulfate (K₂SO₄)
  specifically — not muriate of potash (KCl), which can harm plants if over-applied.
]

#product("EDDHA chelated iron")[
  Sold as "Sequestrene 138," "Miller's Ferriplus," or "Ferrous EDDHA." This form
  remains plant-available at pH 7.0–9.0 where EDTA forms do not. Apply as a soil
  drench for fastest uptake.
]

#product("Chelated micronutrient blend")[
  "Grow More Chelated Micronutrient Mix," "Southern Ag Chelated Liquid
  Micronutrients," or "Ferti-Lome Chelated Liquid Iron and Other Micro Nutrients."
  Look for Fe, Zn, Cu, B, Mn listed in chelated form on the label.
]

#product("Ammonium sulfate (21-0-0)")[
  Widely available (True Value, Home Depot, farm stores). Provides nitrogen without
  phosphorus and mildly acidifies soil over time — doubly beneficial given your
  alkaline conditions.
]

#product("Acidifying fertilizer")[
  #link("https://www.google.com/search?q=hollytone+fertilizer")[Espoma Holly-tone]
  (4-3-4) contains sulfur that gradually lowers root zone pH. The middle number of
  3 (phosphorus) is low; at typical application rates the total P added is small and
  binds rapidly into insoluble calcium phosphate at pH 7.27 — an acceptable tradeoff
  given that no good zero-phosphorus acidifying fertilizer exists in a single product.
  Zero-P alternative: ammonium sulfate (21-0-0) plus separate elemental sulfur
  granules — same acidifying benefit, zero phosphorus addition, slightly less
  convenient. See individual plant files for which plants warrant acidification effort.
]

#product("Low-phosphorus rose fertilizer (potted roses)")[
  #link("https://www.google.com/search?q=espoma+rose+tone+fertilizer")[Espoma Rose-tone] (4-3-2) or
  #link("https://www.google.com/search?q=dr+earth+rose+fertilizer")[Dr. Earth Rose Fertilizer].
  Use a liquid form for container application. See the Knock Out Roses plant section
  for timing and frequency.
]

#warning-callout("Pesticide Note")[
  Broad-spectrum pesticides (pyrethroids, neonicotinoids, organophosphates)can be hazardous to hummingbirds, butterflies, bees, and insect-feeding birds. Use targeted treatments (neem oil, insecticidal soap, Bt, spinosad)
  applied at dawn or dusk. Systemic neonicotinoids should be avoided entirely due to the negative effects on bees.
]


== Application Methods

*Granular products* (ammonium sulfate, potassium sulfate, elemental sulfur):
Pull mulch back from the plant base, broadcast granules evenly out to the drip line,
water in well, then replace mulch.

*Liquid and drench products* (chelated micronutrients, EDDHA iron):
Pull back mulch, pour solution at the base and out to the drip line, water in lightly
afterward to move product into the root zone.

*Crushed rock areas:*
Broadcast granular products over the rock surface and water in — no need to move rock.
