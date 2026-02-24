// ============================================================
// FERTILIZER & NUTRIENT APPLICATION TABLE
// Edit rows below. For product details see content/soil.typ.
// ============================================================
#import "../template.typ": *

#pagebreak(weak: true)
= Fertilizer & Nutrient Application

Per-plant recommendations based on your CSU soil test. No phosphorus additions
to any in-ground plant. See the _Soil Profile & Nutrition_ section for product
details and recommended brands.

#v(0.6em)

// ── Application table ────────────────────────────────────────
// Columns: Plant | Product Type | N-P-K | Timing | Notes
#table(
  columns: (2fr, 1.6fr, 0.8fr, 1.7fr, 2.8fr),
  fill: tbl-fill,
  stroke: tbl-stroke,
  align: (left, left, center, left, left),

  tbl-header-text[Plant],
  tbl-header-text[Product Type],
  tbl-header-text[N-P-K],
  tbl-header-text[Timing],
  tbl-header-text[Notes],

  [Silver Maple (Trees)],
  [N-K only],
  [16-0-8 or 21-0-0],
  [Early spring (young trees)],
  [EDDHA chelated iron + micronutrients in May. Mature trees: micronutrients only.],

  [Emperor Japanese Maple],
  [Acidifying N formula],
  [21-0-0 or Hollytone 4-3-4],
  [Early spring only],
  [EDDHA chelated iron in May. Acid mulch annually. No P. Goal: lower local pH over time.],

  [Skyline Honeylocust],
  [N-K + micronutrients],
  [16-0-8 + chelated Fe/Zn/Cu/B/Mn],
  [Spring N-K + May & June micronutrients],
  [Highest micronutrient priority. Two micronutrient applications recommended.],

  [Spring Snow Crabapple],
  [N-K formula],
  [16-0-8],
  [Early spring (young trees)],
  [Chelated micronutrients in May. Mature trees: micronutrients only.],

  [Autumn Brilliance Serviceberry],
  [N-K + micronutrients],
  [16-0-8 + chelated package],
  [Early spring],
  [Boron critical for fruit set. No P. Compost mulch preferred long-term.],

  [Kentucky Bluegrass Lawn],
  [Zero-P turf formula],
  [32-0-6 or 46-0-0 + 0-0-50],
  [4×: May, Jun, Sep, Oct],
  [Potassium sulfate in Sep & Oct. Chelated Fe/Zn/Mn in spring. 3–4 lbs N / 1,000 sq ft / yr.],

  [Miss Kim Lilac (Shrubs)],
  [N-K only],
  [16-0-8 + 0-0-50 in fall],
  [Spring N-K + potassium sulfate in fall],
  [No bone meal. K (not P) drives bloom quality. Chelated micronutrients in spring.],

  [Yankee Doodle Lilac],
  [N-K only],
  [16-0-8 + 0-0-50],
  [Spring N-K + K in fall],
  [Same approach as Miss Kim. No P-containing products.],

  [Peking Cotoneaster],
  [Compost or skip],
  [—],
  [Compost topdress every 1–2 yrs],
  [Chelated micronutrients in spring. Skip synthetic fertilizer entirely.],

  [Dark Knight Bluebeard],
  [N-K (very light)],
  [16-0-8],
  [Early spring only],
  [Single very light feeding. No P. Drainage is more important than nutrition.],

  [Wichita Blue Juniper (Evergreens)],
  [N-K evergreen or skip],
  [12-0-6 or none],
  [Early spring (optional)],
  [Chelated micronutrients more important. Never use P-containing evergreen products.],

  [Dwarf Globe Blue Spruce],
  [N-K evergreen (light)],
  [12-0-6],
  [Early spring (light)],
  [Chelated micronutrients in spring. Over-fertilizing disrupts compact form.],

  [Mops Mugo Pine],
  [N-K evergreen or skip],
  [12-0-6],
  [Every 1–2 yrs in spring],
  [Light feeding only. Chelated micronutrients in spring.],

  [Daylilies (Perennials)],
  [N-K formula only],
  [16-0-8 or 21-0-0 + 0-0-50],
  [Early spring + chelated micronutrients],
  [No bloom booster. Potassium sulfate side-dress improves blooming.],

  [White Yarrow],
  [None],
  [—],
  [No fertilizer — ever],
  [Lean soil required. Never fertilize. Thin compost only if needed.],

  [Agastache Sunset Hyssop],
  [None],
  [—],
  [No fertilizer needed],
  [Drainage amendment critical. No feeding whatsoever.],

  [Blonde Ambition Blue Grama],
  [None or minimal K],
  [0-0-50 (optional)],
  [Late spring (optional)],
  [Native grass — no fertilizer needed. Light potassium sulfate only if desired.],

  [Northwind Switchgrass],
  [N-K (light)],
  [16-0-8 or 12-0-6],
  [Mid-spring + K in fall],
  [No P. Light potassium sulfate in fall improves stem stiffness.],

  [Rocky Mountain Penstemon],
  [None],
  [—],
  [No fertilizer — ever],
  [Lean soil essential. Rich soil shortens plant life dramatically.],

  [Autumn Joy Sedum],
  [None to minimal K],
  [0-0-50 (optional)],
  [Early spring (minimal)],
  [No P. Lean conditions produce compact plants.],

  [Knock Out Roses (Potted)],
  [Low-P rose formula],
  [5-1-7 or similar],
  [Every 3–4 wks, Apr–mid Aug],
  [Potted plants differ from tested soil. Low-P rose fertilizer with high K. Liquid chelated micronutrients monthly.],

  [Candytuft (Potted)],
  [N-K container formula],
  [16-0-8 or low-P granular],
  [Spring + mid-season],
  [Potted plants differ from tested soil. No high-P bloom booster.],
)
