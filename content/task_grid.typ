// ============================================================
// SEASONAL TASK GRID
// ◆ = perform this task in the highlighted month.
// Edit task rows below; true = active month, false = inactive.
// ============================================================
#import "../template.typ": *

#pagebreak(weak: true)
= Commerce City Seasonal Task Grid

Use this as a priority index. Use the month-by-month checklist for full details.

// Helper: shorthand for true/false month arrays
#let Y = true
#let N = false

// ── Task data ────────────────────────────────────────────────
// Format: (label, (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec))
// Use a category string instead of a tuple for section dividers.

#let grid-data = (
  "TREES",
  ("1. Structural pruning (dormant/summer)",      (N,Y,N,N,N,N,Y,N,N,N,N,N)),
  ("2. Spring N-K pass",                          (N,N,N,Y,N,N,N,N,N,N,N,N)),
  ("3. May micronutrient pass",                   (N,N,N,N,Y,N,N,N,N,N,N,N)),
  ("4. EDDHA iron (Honeylocust)",                 (N,N,N,N,Y,Y,N,N,N,N,N,N)),
  ("5. EDDHA iron (Japanese Maple)",              (N,N,N,N,Y,N,Y,N,N,N,N,N)),
  ("6. Trunk wraps (install/remove)",             (N,N,Y,N,N,N,N,N,N,Y,Y,N)),

  "EVERGREENS",
  ("1. Spring feed / acidifying pass",              (N,N,N,Y,N,N,N,N,N,N,N,N)),
  ("2. Weekly mite scouting",                       (N,N,N,N,N,Y,Y,Y,N,N,N,N)),
  ("3. Anti-desiccant (juniper/spruce)",            (N,N,N,N,N,N,N,N,N,N,Y,N)),

  "SHRUBS",
  ("1. Spring N-K pass",                           (N,N,N,Y,N,N,N,N,N,N,N,N)),
  ("2. Post-bloom lilac prune",                    (N,N,N,N,N,Y,N,N,N,N,N,N)),
  ("3. Bluebeard dry-down",                        (N,N,N,N,N,N,N,Y,N,N,N,N)),
  ("4. Fall potassium sulfate pass",               (N,N,N,N,N,N,N,N,Y,N,N,N)),

  "PERENNIALS & ORNAMENTAL GRASSES",
  ("1. Late-winter cutback",                       (N,Y,Y,N,N,N,N,N,N,N,N,N)),
  ("2. Spring light feed (where used)",            (N,N,N,Y,N,N,N,N,N,N,N,N)),
  ("3. Deadhead / seasonal cleanup",               (N,N,N,N,N,Y,Y,Y,N,N,N,N)),
  ("4. Mulch tender crowns before freeze",         (N,N,N,N,N,N,N,N,N,Y,N,N)),

  "KENTUCKY BLUEGRASS LAWN",
  ("1. Pre-emergent passes",                       (N,N,Y,N,N,N,N,Y,N,N,N,N)),
  ("2. Spring N passes",                           (N,N,N,N,Y,Y,N,N,N,N,N,N)),
  ("3. Surface check / aerate + overseed",        (N,N,N,N,N,N,N,Y,Y,N,N,N)),
  ("4. Fall liquid N/K passes",                    (N,N,N,N,N,N,N,N,Y,N,N,N)),
  ("5. Late-October winterizer",                   (N,N,N,N,N,N,N,N,N,Y,N,N)),
  ("6. Mow at 2.5–3 inches",                       (N,N,N,Y,Y,Y,Y,Y,Y,Y,N,N)),

  "POTTED PLANTS",
  ("1. Spring container refresh",                  (N,N,N,Y,N,N,N,N,N,N,N,N)),
  ("2. Move outside after last frost",             (N,N,N,N,Y,N,N,N,N,N,N,N)),
  ("3. Fertilizer cycle (3–4 weeks)",              (N,N,N,N,Y,Y,Y,Y,N,N,N,N)),
  ("4. Monthly container iron",                    (N,N,N,N,Y,Y,Y,Y,N,N,N,N)),
  ("5. Winter protection/storage",                 (N,N,N,N,N,N,N,N,N,Y,Y,N)),

  "GENERAL GARDEN",
  ("1. Mulch refresh",                             (N,N,N,Y,N,N,N,N,N,N,N,N)),
  ("2. Compost tea passes",                        (N,N,N,Y,N,N,N,N,Y,N,N,N)),
  ("3. Wetting-agent pass",                        (N,N,N,N,N,Y,Y,Y,N,N,N,N)),
  ("4. Winter watering",                           (Y,Y,Y,N,N,N,N,N,N,N,Y,Y)),
  ("5. Deep water before freeze",                  (N,N,N,N,N,N,N,N,N,Y,N,N)),
  ("6. Blow out irrigation systems",               (N,N,N,N,N,N,N,N,N,N,Y,N)),
)

// ── Render the grid ──────────────────────────────────────────
#{
  let month-labels = ([Jan],[Feb],[Mar],[Apr],[May],[Jun],[Jul],[Aug],[Sep],[Oct],[Nov],[Dec])
  let col-w = (172pt, ..range(12).map(_ => 1fr))

  // Build cell list
  let cells = ()

  // Header row
  cells += (table.cell(fill: forest)[#text(fill: white, weight: "bold", size: 9.2pt)[Task (Priority Order)]],)
  for m in month-labels {
    cells += (table.cell(fill: forest, align: center)[#text(fill: white, weight: "bold", size: 9.2pt)[#m]],)
  }

  // Data rows
  for item in grid-data {
    if type(item) == str {
      // Category row spanning all 13 columns
      cells += (table.cell(colspan: 13, fill: cat-cell)[
        #text(weight: "bold", fill: forest, size: 9pt)[#item]
      ],)
    } else {
      let (label, months) = item
      cells += ([#text(size: 9pt)[#label]],)
      for active in months {
        if active {
          cells += (table.cell(fill: active-cell, align: center)[
            #text(fill: forest, weight: "bold", size: 6.5pt)[◆]
          ],)
        } else {
          cells += (table.cell(align: center)[
            #text(fill: luma(205), size: 6.2pt)[·]
          ],)
        }
      }
    }
  }

  table(
    columns: col-w,
    stroke: 0.4pt + luma(210),
    inset: (x: 4pt, y: 4.5pt),
    ..cells
  )
}
