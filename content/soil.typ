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
                    [*Do NOT add any P fertilizers, bloom boosters, or bone meal.* Retest in 2 years to track decline.],
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
  worsening micronutrient deficiency with every P application.
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
  phosphorus and mildly acidifies soil — doubly beneficial for your alkaline
  conditions and the Japanese Maple.
]

#product("Acidifying fertilizer (Japanese Maple only)")[
  #link("https://www.google.com/search?q=hollytone+fertilizer")[Espoma Holly-tone] (4-3-4) contains sulfur which gradually acidifies the
  root zone. Apply annually around the Japanese Maple. Ammonium sulfate also has a
  mild acidifying effect.
]

#product("Low-phosphorus rose fertilizer (potted roses)")[
  #link("https://www.google.com/search?q=espoma+rose+tone+fertilizer")[Espoma Rose-tone] (4-3-2) or
  #link("https://www.google.com/search?q=dr+earth+rose+fertilizer")[Dr. Earth Rose Fertilizer].
  Apply liquid form every 3–4 weeks to container roses April through mid-August.
]

#product("Application method")[
  *Granular products* (ammonium sulfate, potassium sulfate): pull mulch back from
  the plant base, broadcast granules to the drip line, water in, replace mulch.
  *Liquid/spray products* (chelated micronutrients, EDDHA iron): apply as soil
  drench — pull back mulch, pour at the base and out to the drip line, water in
  lightly. *Crushed rock areas:* broadcast granular products over the rock surface
  and water in.
]
