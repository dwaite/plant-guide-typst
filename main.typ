// ============================================================
// MAIN.TYP — Document assembly
// This file only controls ordering and structure.
// Edit content in content/ and content/plants/ files.
// ============================================================

#import "template.typ": *
#show: doc-setup


// ── Cover page ───────────────────────────────────────────────
#page(margin: 0pt)[
  #image("images/maple.jpg", width: 100%, height: 100%, fit: "cover")
  #place(
    bottom + center,
    dy: -1.4in,
    block(
      fill: rgb(0, 0, 0, 62%),
      inset: (x: 2.2em, y: 1.2em),
      radius: 5pt
    )[
      #text(size: 27pt, weight: "bold", fill: white)[Commerce City Plant Care Guide]
      #linebreak()
      #v(4pt)
      #text(size: 13pt, fill: rgb("#CCEECC"))[Zone 5b · Commerce City, Colorado]
      #linebreak()
      #text(size: 11pt, fill: rgb("#AADDAA"))[Last frost ~May 10 · First fall frost ~October 5]
    ]
  )
]


// ── Soil Profile & Nutrition ─────────────────────────────────
#include "content/soil.typ"

// ── Fertilizer & Nutrient Application ────────────────────────
#include "content/fertilizer.typ"

// ── Irrigation & Watering ────────────────────────────────────
#include "content/watering.typ"


// ══════════════════════ REFERENCE SECTIONS ════════════════════

#include "content/wildlife.typ"
#include "content/weed_control.typ"
#include "content/task_grid.typ"
#include "content/checklist.typ"

// ══════════════════════════ PLANT SECTIONS ════════════════════

// ── Trees ────────────────────────────────────────────────────
#group-header("TREES")
#include "content/plants/silver_maple.typ"
#pagebreak()
#include "content/plants/honeylocust.typ"
#pagebreak()
#include "content/plants/crabapple.typ"
#pagebreak()
#include "content/plants/serviceberry.typ"
#pagebreak()
#include "content/plants/japanese_maple.typ"

// ── Evergreens ───────────────────────────────────────────────
#group-header("EVERGREENS")
#include "content/plants/juniper.typ"
#pagebreak()
#include "content/plants/blue_spruce.typ"
#pagebreak()
#include "content/plants/mugo_pine.typ"

// ── Shrubs ───────────────────────────────────────────────────
#group-header("SHRUBS")
#include "content/plants/cotoneaster.typ"
#pagebreak()
#include "content/plants/yankee_doodle_lilac.typ"
#pagebreak()
#include "content/plants/miss_kim_lilac.typ"
#pagebreak()
#include "content/plants/bluebeard.typ"

// ── Lawn ─────────────────────────────────────────────────────
#group-header("LAWN")
#include "content/plants/bluegrass.typ"

// ── Perennials ───────────────────────────────────────────────
#group-header("PERENNIALS")
#include "content/plants/daylilies.typ"
#pagebreak()
#include "content/plants/yarrow.typ"
#pagebreak()
#include "content/plants/agastache.typ"
#pagebreak()
#include "content/plants/penstemon.typ"
#pagebreak()
#include "content/plants/sedum.typ"

// ── Ornamental Grasses ───────────────────────────────────────
#group-header("ORNAMENTAL GRASSES")
#include "content/plants/blue_grama.typ"
#pagebreak()
#include "content/plants/switchgrass.typ"

// ── Potted Plants ────────────────────────────────────────────
#group-header("POTTED PLANTS")
#include "content/plants/knockout_roses.typ"
#pagebreak()
#include "content/plants/bacopa.typ"
#pagebreak()
#include "content/plants/candytuft.typ"

