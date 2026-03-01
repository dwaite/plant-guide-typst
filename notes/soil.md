# Soil — Reference Data & Interpretation

This file records the soil test results and the reasoning behind how they drive
recommendations across the document. Update when a new soil test is performed.

Audit note (March 2026): High-impact soil chemistry claims in this file were
cross-checked with extension sources; see `notes/research/2026_audit_ledger.md`
and `notes/research/2026_sources.md`.

---

## CSU Soil Test Results (most recent)

| Parameter    | Result       | Status    |
|--------------|-------------|-----------|
| Texture      | Heavy clay (observational — no particle size analysis performed) | — |
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
| Chelated micronutrient blend (LESCO Chelated Micro Mix — all in-ground trees, shrubs, perennials) | Each May | Annual correction for lockout |
| EDDHA iron drench — Honeylocust (May + June), Japanese Maple (May + early July) | May, June, July | pH-stable iron for the two highest chlorosis-risk plants; applied in addition to the blend, not instead of it |
| Soil pH spot-check (foundation beds) | Spring | Confirm Miss Kim root zone pH |
| Full CSU soil retest | 2027 (2 years after last test) | Confirm P is declining; re-evaluate N and K |
| Elemental sulfur application (if needed) | Fall | Gradual acidification; sulfur works slowly over winter |

---

## Soil Texture: Data Gap

No particle size analysis (clay/silt/sand percentages) has been performed. The
heavy-clay characterization is based on observed behavior: slow drainage, surface
cracking in summer, high compaction. This is the right working assumption for this
lot, but it is not confirmed by a formal test.

**Why it matters:** Amendment ratios for drainage-sensitive plants (agastache,
penstemon, bluebeard — currently specified at 50% coarse grit) and drip interval
decisions are calibrated to the observed heavy-clay behavior. Until a particle size
test is done, keep these ratios as-is — the observed behavior is the best available
evidence.

**To confirm:** CSU Extension offers particle size analysis as an add-on to their
standard nutrient test — worth adding at the next retest cycle (2027).

---

## USDA Web Soil Survey Findings — and Why They Don't Apply Here

The WSS was downloaded (February 2026) for the property parcel. The lot is labeled
map unit **TtB — "Truckton loamy sand, 0 to 3 percent slopes"** (possibly TuB,
"Truckton sandy loam"), which is 80–85% Truckton series.

**What the Truckton series looks like in undisturbed native soil:**
- Parent material: wind re-worked alluvium derived from arkose (a feldspar-rich sandstone)
- Surface texture: loamy sand to sandy loam
- Particle-size family: coarse-loamy (< 18% clay in the control section)
- Drainage class: well drained; hydrologic group A (highest permeability)
- Shrink-swell potential: low; water movement: high

This is essentially a sandy, free-draining soil — the opposite of what is observed
on this lot.

**Why the WSS data does not match observed behavior:**
The lot is a Commerce City residential parcel. New residential construction in this
area routinely uses excavated foundation subsoil as fill to level lots. Foundation
excavation brings up deeper, often clay-rich subsoil layers (Bt or Bk horizons)
that bear no resemblance to the mapped native surface series. The Truckton surface
profile — loamy sand with low clay content — is very likely buried under or replaced
by fill material from surrounding construction.

**Practical implication:** The WSS soil series data is not a reliable predictor of
actual soil behavior at this property. The observational evidence (slow drainage,
surface cracking, high compaction) is the correct basis for all recommendations.
Treat this soil as heavy clay or clay-fill for all planting, amendment, and
irrigation purposes unless a particle size test says otherwise.

**The one consistent finding:** Both the native Truckton and the observed fill
behavior explain the high calcium / alkaline pH. Arkose-derived soils and Colorado
Front Range subsoils both accumulate calcium carbonate naturally.

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
