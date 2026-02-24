// ============================================================
// SEASONAL TASK GRID
// ◆ = perform this task in the highlighted month.
// Edit task rows below; true = active month, false = inactive.
// ============================================================
#import "../template.typ": *

#pagebreak(weak: true)
= Seasonal Task Grid

Green cells (◆) indicate the month(s) to perform each task.
Based on Commerce City Zone 5b: last frost \~May 10, first fall frost \~October 5.

// Helper: shorthand for true/false month arrays
#let Y = true
#let N = false

// ── Task data ────────────────────────────────────────────────
// Format: (label, (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec))
// Use a category string instead of a tuple for section dividers.

#let grid-data = (
  "TREES",
  ("Prune trees (dormant)",              (Y,Y,N,N,N,N,Y,N,N,N,N,N)),
  ("Prune Silver Maple (summer)",         (N,N,N,N,N,N,Y,N,N,N,N,N)),
  ("Deep water trees (non-drip)",         (N,N,N,N,Y,Y,Y,Y,N,N,N,N)),
  ("Fertilize trees (N-K)",               (N,N,N,Y,N,N,N,N,N,N,N,N)),
  ("Chelated micronutrients (all)",        (N,N,N,N,Y,N,N,N,N,Y,N,N)),
  ("EDDHA iron: Honeylocust & J. Maple",  (N,N,N,N,Y,N,Y,N,N,N,N,N)),
  ("Wrap young tree trunks",              (N,N,N,N,N,N,N,N,N,N,Y,Y)),

  "EVERGREENS",
  ("Fertilize evergreens (N-K)",          (N,N,N,Y,N,N,N,N,N,N,N,N)),
  ("Pinch mugo pine candles",             (N,N,N,N,Y,Y,N,N,N,N,N,N)),
  ("Inspect: bagworms & spider mites",    (N,N,N,N,N,Y,Y,N,N,N,N,N)),

  "SHRUBS",
  ("Prune lilacs (post-bloom only)",      (N,N,N,N,N,Y,N,N,N,N,N,N)),
  ("Prune Cotoneaster & Bluebeard",       (Y,Y,N,N,N,N,N,N,N,N,N,N)),
  ("Fertilize shrubs (N-K)",              (N,N,N,Y,N,N,N,N,N,N,N,N)),
  ("K-sulfate (all shrubs, fall)",        (N,N,N,N,N,N,N,N,N,Y,N,N)),

  "PERENNIALS & ORNAMENTAL GRASSES",
  ("Cut back grasses & perennials",       (N,Y,Y,N,N,N,N,N,N,N,N,N)),
  ("Fertilize perennials (light)",        (N,N,N,Y,N,N,N,N,N,N,N,N)),
  ("Deadhead spent blooms",               (N,N,N,N,N,Y,Y,Y,N,N,N,N)),
  ("Mulch crowns before winter",          (N,N,N,N,N,N,N,N,N,N,Y,N)),
  ("Divide overcrowded clumps",           (N,N,N,Y,N,N,N,N,N,N,N,N)),

  "KENTUCKY BLUEGRASS LAWN",
  ("Pre-emergent herbicide",              (N,N,N,Y,N,N,N,N,Y,N,N,N)),
  ("Fertilize lawn (spring)",             (N,N,N,N,Y,N,N,N,N,N,N,N)),
  ("Fertilize lawn (summer light)",       (N,N,N,N,N,Y,N,N,N,N,N,N)),
  ("Fertilize lawn (fall primary)",       (N,N,N,N,N,N,N,N,Y,N,N,N)),
  ("Winterizer potassium",                (N,N,N,N,N,N,N,N,N,Y,N,N)),
  ("Mow at 2.5–3\"",                      (N,N,N,Y,Y,Y,Y,Y,Y,Y,N,N)),
  ("Core aerate",                         (N,N,N,N,N,N,N,Y,N,N,N,N)),
  ("Overseed thin spots",                 (N,N,N,N,N,N,N,Y,Y,N,N,N)),

  "POTTED PLANTS",
  ("Move outside",                        (N,N,N,N,Y,N,N,N,N,N,N,N)),
  ("Fertilize potted plants",             (N,N,N,N,Y,Y,Y,N,N,N,N,N)),
  ("Move to winter storage",              (N,N,N,N,N,N,N,N,N,N,Y,N)),

  "GENERAL GARDEN",
  ("Apply / refresh mulch (2–3\")",       (N,N,N,Y,N,N,N,N,N,N,N,N)),
  ("Winter water all plants",             (Y,Y,Y,N,N,N,N,N,N,N,N,Y)),
  ("Deep water before freeze",            (N,N,N,N,N,N,N,N,N,Y,N,N)),
  ("Blow out irrigation systems",         (N,N,N,N,N,N,N,N,N,N,Y,N)),
  ("Pre-emergent: beds & rock areas",     (N,N,N,Y,N,N,Y,N,N,N,N,N)),
  ("Annual soil test",                    (N,N,N,N,N,N,N,N,N,Y,N,N)),
)

// ── Render the grid ──────────────────────────────────────────
#{
  let month-labels = ([Jan],[Feb],[Mar],[Apr],[May],[Jun],[Jul],[Aug],[Sep],[Oct],[Nov],[Dec])
  let col-w = (160pt, ..range(12).map(_ => 1fr))

  // Build cell list
  let cells = ()

  // Header row
  cells += (table.cell(fill: forest)[#text(fill: white, weight: "bold", size: 10pt)[Task]],)
  for m in month-labels {
    cells += (table.cell(fill: forest, align: center)[#text(fill: white, weight: "bold", size: 10pt)[#m]],)
  }

  // Data rows
  for item in grid-data {
    if type(item) == str {
      // Category row spanning all 13 columns
      cells += (table.cell(colspan: 13, fill: cat-cell)[
        #text(weight: "bold", fill: forest, size: 9.5pt)[#item]
      ],)
    } else {
      let (label, months) = item
      cells += ([#text(size: 9pt)[#label]],)
      for active in months {
        if active {
          cells += (table.cell(fill: active-cell, align: center)[
            #text(fill: forest, weight: "bold", size: 7pt)[◆]
          ],)
        } else {
          cells += (table.cell(align: center)[
            #text(fill: luma(205), size: 7pt)[·]
          ],)
        }
      }
    }
  }

  table(
    columns: col-w,
    stroke: 0.4pt + luma(210),
    inset: (x: 4pt, y: 5pt),
    ..cells
  )
}

#v(0.5em)
#info-callout("Key")[
  ◆ = Do this task during the highlighted month(s). Tasks are listed in priority
  order within each category. See the Month-by-Month Checklist for detailed
  instructions on each task.
]
