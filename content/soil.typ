// ============================================================
// SOIL PROFILE & NUTRITION
// Edit nutrient rows and product descriptions below.
// ============================================================
#import "../template.typ": *
#import "generated/reference_data.typ": soil-profile-table, soil-ph

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
#soil-profile-table

#danger-callout("⚠ Critical Soil Rule")[
  Do NOT apply any product containing phosphorus to any in-ground plant in this
  landscape. This includes 10-10-10, 5-10-5, bloom boosters, bone meal,
  superphosphate, and most "starter fertilizers." High soil phosphorus combined
  with alkaline pH chemically locks out iron, zinc, copper, boron, and manganese —
  worsening micronutrient deficiency with every P application. Soil should be retested to verify P levels.
]

#info-callout("Annual Priority Action")[
  Apply a chelated micronutrient blend (Fe, Zn, Cu, B, Mn) to all trees, shrubs,
  and most perennials each May. Use EDDHA chelated iron specifically for targeted
  in-ground correction where needed — it remains plant-available at pH #soil-ph
  where other iron forms do not. This is the single
  highest-impact annual task for your entire landscape.
]
