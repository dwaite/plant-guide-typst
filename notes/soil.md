# Soil — Reference Data & Interpretation

This file records the soil test results and the reasoning behind how they drive
recommendations across the document. Update when a new soil test is performed.

---

## CSU Soil Test Results (most recent)

| Parameter    | Result       | Status    |
|--------------|-------------|-----------|
| Texture      | Clay-dominant, some sand | — |
| pH           | 7.27         | Mildly alkaline |
| Nitrogen (N) | —            | LOW |
| Phosphorus (P) | —          | HIGH |
| Potassium (K) | —           | LOW |
| Sulfur (S)   | —            | Optimal |
| Calcium (Ca) | —            | HIGH |
| Magnesium (Mg) | —          | Optimal |
| Sodium (Na)  | —            | Optimal |
| Iron (Fe)    | —            | VERY LOW |
| Zinc (Zn)    | —            | VERY LOW |
| Copper (Cu)  | —            | VERY LOW |
| Boron (B)    | —            | VERY LOW |
| Manganese (Mn) | —          | Low |

*Exact numerical values from the original CSU report should be added here when
available for future comparison.*

---

## pH Context: Better Than Average, Still Alkaline

Commerce City soil typically runs pH 7.5–8.5. The tested 7.27 is meaningfully
better than the local baseline, but still alkaline enough to cause micronutrient
lockout for most plants. This is a manageable situation with the right inputs — it
is not a remediation emergency.

Micronutrient lockout begins above approximately pH 6.5–7.0 for most elements.
At 7.27, the lockout is real but not severe. Annual chelated micronutrient
applications compensate effectively.

**What to monitor:** pH should be stable or declining very slowly as acidifying
nitrogen sources and organic matter accumulate. If it rises above 7.5, more
aggressive acidification is warranted.

---

## The Calcium / Phosphorus / Micronutrient Relationship

These three problems are chemically linked:

1. **High calcium** is the root cause of alkaline pH at this property. Calcium
   carbonate (CaCO₃) from natural soil formation and possibly from the construction
   process drives pH upward.

2. **Alkaline pH locks out micronutrients.** Fe, Zn, Cu, Mn, and B become
   insoluble in alkaline conditions even when physically present in the soil. This
   is why chelated forms are required — they remain soluble at high pH where
   non-chelated forms do not.

3. **High phosphorus intensifies iron lockout.** Excess P competes with Fe for
   root uptake sites. Every phosphorus addition makes iron deficiency worse. This
   is why the no-P rule is non-negotiable, not merely advisory.

Breaking this chain requires: (a) no P additions, (b) EDDHA-chelated iron
specifically, and (c) gradual acidification with sulfur-containing amendments.

---

## Foundation Bed pH Warning

Concrete foundations leach calcium carbonate continuously. Soil pH within 12 inches
of a concrete foundation wall can reach 8.5+ even when the general yard pH is 7.27.
This effect extends for years after construction.

The Miss Kim Lilacs are planted in the east foundation bed. Their persistent
stagnation may partially reflect pH above 8.0 at their root zone — a level at
which micronutrient lockout is severe and growth essentially stops.

**Test to confirm:** Use a pH meter probe or test kit directly within 12 inches of
the foundation. If above 8.0, apply elemental sulfur specifically to the foundation
bed area (separate from general yard treatment).

---

## Scheduled Actions

| Action | Timing | Rationale |
|--------|--------|-----------|
| Chelated micronutrient package (EDDHA iron + full blend) | Each May | Annual correction for lockout |
| Second EDDHA iron drench (Japanese Maple only) | Early July | Midsummer demand under full afternoon sun |
| Soil pH spot-check (foundation beds) | Spring | Confirm Miss Kim root zone pH |
| Full CSU soil retest | 2027 (2 years after last test) | Confirm P is declining; re-evaluate N and K |
| Elemental sulfur application (if needed) | Fall | Gradual acidification; sulfur works slowly over winter |

---

## Clay Soil Management Notes

Clay soil presents two competing risks:

- **Underwatering:** Clay wets slowly and distributes water unevenly. Drip
  irrigation with Smart Cycle (soak and cycle) improves penetration.
- **Overwatering:** Clay holds moisture far longer than sandy or loam soil. Crown
  rot and root rot are common in plants that are sensitive to prolonged wetness
  (Bluebeard, Yarrow, Penstemon, Mugo Pine).

The emitter sizing and drip stop decisions in data/plants.toml and notes/irrigation.md
are designed around clay's moisture-retention characteristics.

Organic matter additions (compost top-dressing) gradually improve clay structure
over several years. This is a low-risk background improvement worth continuing
annually in the planting beds.
