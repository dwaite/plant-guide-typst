// ============================================================
// WILDLIFE IN YOUR LANDSCAPE
// Edit the rows array below to update wildlife entries.
// ============================================================
#import "../template.typ": *

#pagebreak(weak: true)
= Wildlife in Your Landscape

Your landscape supports a diverse wildlife community for a suburban setting.
★★★ = high value · ★★ = moderate value · ★ = occasional use

// ── Wildlife table ───────────────────────────────────────────
// Food column uses line breaks (\) between entries — star rating first.
#table(
  columns: (1.6fr, 2.6fr, 2.7fr),
  fill: tbl-fill,
  stroke: tbl-stroke,
  align: (left, left, left),

  tbl-header-text[Wildlife],
  tbl-header-text[Primary Food / Habitat Plants],
  tbl-header-text[Management Notes],

  [*Hummingbirds*],
  [
    #text(fill: forest, weight: "bold")[★★★] Agastache Sunset Hyssop (Jul–Sep) \
    #text(fill: forest, weight: "bold")[★★★] Rocky Mountain Penstemon (May–Jun) \
    #text(fill: forest)[★★ ] Knock Out Roses (Jun–Oct) \
    #text(fill: text-muted)[★   ] Lilacs and Spring Snow Crabapple (May)
  ],
  [Provide a water source. Leave Agastache standing through September — it overlaps with ruby-throat fall migration. Avoid pesticides near any blooming plant.],

  [*Butterflies & Bees*],
  [
    #text(fill: forest, weight: "bold")[★★★] Dark Knight Bluebeard (Jul–Sep) \
    #text(fill: forest, weight: "bold")[★★★] Agastache Sunset Hyssop (Jul–Sep) \
    #text(fill: forest, weight: "bold")[★★★] White Yarrow (Jun–Aug) \
    #text(fill: forest, weight: "bold")[★★★] Rocky Mountain Penstemon (May–Jun) \
    #text(fill: forest)[★★ ] Autumn Brilliance Serviceberry (Apr–May) \
    #text(fill: forest)[★★ ] Lilacs (May)
  ],
  [Bees and butterflies share most of the same peak plants (Jul–Sep), so one combined row reflects how the landscape works. Monarchs pass through mid-Aug to September. Leave Bluebeard blooming until frost. Minimize pesticide use May onward.],

  [*House Finches*],
  [
    #text(fill: forest, weight: "bold")[★★★] Serviceberry berries (Jun) \
    #text(fill: forest)[★★ ] Autumn Joy Sedum seed heads (Sep–Feb) \
    #text(fill: forest)[★★ ] Blue Grama seed heads (Aug–Feb) \
    #text(fill: forest)[★★ ] Switchgrass seeds (Sep–Feb) \
    #text(fill: forest)[★★ ] Lilac structure (nesting)
  ],
  [Leave all seed heads standing through winter. House Finches are year-round residents and use your landscape heavily in winter.],

  [*American Robins*],
  [
    #text(fill: forest, weight: "bold")[★★★] Serviceberry berries (Jun) \
    #text(fill: forest, weight: "bold")[★★★] Cotoneaster berries (Sep–Nov) \
    #text(fill: forest)[★★ ] Silver Maple samaras (spring) \
    #text(fill: forest)[★★ ] Lawn worms and grubs
  ],
  [Primary frugivore in your landscape. Serviceberry and Cotoneaster together provide spring-to-fall fruit succession — a strong reason to value both plants.],

  [*Collared Doves*],
  [
    #text(fill: forest, weight: "bold")[★★★] Cotoneaster berries (Sep–Nov) \
    #text(fill: forest)[★★ ] Serviceberry berries (Jun) \
    #text(fill: forest)[★★ ] Lawn and ground foraging \
    #text(fill: text-muted)[★   ] Lilac stems (perching)
  ],
  [Ground feeders — open lawn is their primary foraging territory. Pairs likely breed in your area annually.],

  [*Red-winged Blackbirds*],
  [
    #text(fill: forest, weight: "bold")[★★★] Switchgrass seeds (Sep–Nov) \
    #text(fill: forest)[★★ ] Lawn insects (spring–summer) \
    #text(fill: text-muted)[★   ] Serviceberry berries (Jun)
  ],
  [Switchgrass is their primary landscape food source. Often nesting near tall grass clumps in the region.],

  [*European Starlings*],
  [
    #text(fill: forest, weight: "bold")[★★★] Cotoneaster berries (Sep–Nov) \
    #text(fill: forest, weight: "bold")[★★★] Serviceberry berries (Jun) \
    #text(fill: forest)[★★ ] Juniper berries (fall–winter) \
    #text(fill: text-muted)[★   ] Lawn invertebrates
  ],
  [Will strip berry plants quickly in flocks. Non-native but an established part of the landscape community.],

  [*Northern Flicker*],
  [
    #text(fill: forest, weight: "bold")[★★★] Lawn ants and beetle larvae \
    #text(fill: forest)[★★ ] Blue Grama clump base insects \
    #text(fill: text-muted)[★   ] Cotoneaster berries
  ],
  [Ground-foraging woodpecker — digging in your lawn is normal and beneficial (targets ants and grubs). Protect young tree bark from incidental pecking with trunk wrap.],

  [*Cottontail Rabbits* #text(fill: red-warn)[(pest)]],
  [
    #text(fill: red-warn, weight: "bold")[★★★] Young tree bark (winter) \
    #text(fill: red-warn, weight: "bold")[★★★] Rose bushes \
    #text(fill: red-warn)[★★ ] Lilac new shoots \
    #text(fill: text-muted)[★   ] Daylily shoots, Penstemon (occasional)
  ],
  [Hardware cloth cylinders (18" tall) protect young tree trunks. Elevate container plants. Bluebeard, Agastache, Yarrow, and Penstemon are relatively resistant due to aromatic or bitter foliage.],

  [*Field Mice* #text(fill: red-warn)[(pest)]],
  [
    #text(fill: red-warn)[★★ ] Young tree trunk bark (winter) \
    #text(fill: text-muted)[★   ] Bulb and root storage areas \
    #text(fill: text-muted)[★   ] Lawn edges near mulch
  ],
  [Maintain a 4–6" mulch-free zone around all tree trunks. Hardware cloth cylinders on young trees protect from both rabbits and mice simultaneously.],
)