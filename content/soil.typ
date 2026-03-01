// ============================================================
// SOIL PROFILE & NUTRITION
// Edit nutrient rows and product descriptions below.
// ============================================================
#import "../template.typ": *

#pagebreak(weak: true)
= Soil Profile & Nutrition

All fertilizer decisions in this guide are driven by your CSU soil test results.
The most important actions: avoid all phosphorus additions, supplement nitrogen and
potassium as listed per plant, and apply the chelated micronutrient blend every spring.
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
                    [Include in chelated micronutrient blend annually],
  [Copper (Cu)],    text(fill: status-warn, weight: "bold")[⚠ VERY LOW],
                    [Include in chelated micronutrient blend annually],
  [Boron (B)],      text(fill: status-warn, weight: "bold")[⚠ VERY LOW],
                    [Include in chelated micronutrient blend; critical for Serviceberry fruit set],
  [Manganese (Mn)], text(fill: status-warn)[⚠ Low],
                    [Include in chelated micronutrient blend annually],
)

#danger-callout("⚠ Critical Soil Rule")[
  Do NOT apply any product containing phosphorus to any in-ground plant in this
  landscape. This includes 10-10-10, 5-10-5, bloom boosters, bone meal,
  superphosphate, and most "starter fertilizers." High soil phosphorus combined
  with alkaline pH chemically locks out iron, zinc, copper, boron, and manganese —
  worsening micronutrient deficiency with every P application. Soil should be retested to verify P levels.
]

#info-callout("Annual Priority Action")[
  Apply a chelated micronutrient blend (Fe, Zn, Cu, B, Mn) to all trees, shrubs,
  and most perennials each May. Use EDDHA chelated iron specifically — it remains
  plant-available at pH 7.27 where other iron forms do not. This is the single
  highest-impact annual task for your entire landscape.
]

