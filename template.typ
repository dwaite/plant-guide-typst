// ============================================================
// TEMPLATE.TYP — Commerce City Plant Care Guide
// All styling lives here. Content files import this.
// ============================================================

// ── Colour palette ──────────────────────────────────────────
#let forest        = rgb("#2E5E1E")
#let forest-mid    = rgb("#3A7A20")
#let forest-light  = rgb("#5A8A3A")
#let cell-green    = rgb("#F5F9F0")
#let active-cell   = rgb("#A8D08A")
#let cat-cell      = rgb("#D5E8C8")
#let amber         = rgb("#D4860A")
#let amber-bg      = rgb("#FFF3CD")
#let red-warn      = rgb("#8B2000")
#let border-grey   = rgb("#CCCCCC")
#let text-main     = rgb("#333333")
#let text-muted    = rgb("#666666")
#let text-light    = rgb("#999999")
#let status-warn   = rgb("#B05800")
#let status-ok     = rgb("#1A6A10")
#let status-high   = rgb("#7A1010")
#let link-blue     = rgb("#1155CC")

// ── Document setup (call via #show: doc-setup) ───────────────
#let doc-setup(doc) = {
  set document(title: "Plant Care Guide — Commerce City, CO")

  set page(
    paper: "us-letter",
    margin: (top: 0.75in, bottom: 0.5in, left: 0.5in, right: 0.5in),
    header: context {
      if counter(page).get().first() > 1 {
        set text(size: 8.5pt, fill: text-muted)
        grid(
          columns: (1fr, auto),
          align: (left, right),
          [Commerce City Plant Care Guide — Zone 5b],
          counter(page).display("1")
        )
        v(-2pt)
        line(length: 100%, stroke: 0.5pt + luma(210))
      }
    }
  )

  set text(
    font: ("Helvetica Neue", "Arial"),
    size: 9pt,
    fill: text-main,
    lang: "en"
  )

  set par(
    leading: 0.8em,
    spacing: 1.5em,
    justify: true
  )

  // ── Heading styles ───────────────────────────────────────
  // h1: Major document sections
  show heading.where(level: 1): it => {
    v(1.6em, weak: true)
    block(
      width: 100%,
      inset: (bottom: 5pt),
      stroke: (bottom: 2pt + forest)
    )[
      #text(size: 17pt, weight: "bold", fill: forest, it.body)
    ]
    v(0.55em, weak: true)
  }

  // h2: Group dividers and sub-sections
  show heading.where(level: 2): it => {
    v(1.3em, weak: true)
    text(size: 13pt, weight: "bold", fill: forest-mid, it.body)
    v(0.35em, weak: true)
  }

  // h3: Plant care categories (Watering, Fertilization, etc.)
  show heading.where(level: 3): it => {
    v(1.6em, weak: true)
    text(size: 11pt, weight: "bold", fill: forest-light, it.body)
    v(0.8em, weak: true)
  }

  doc
}


// ── Group section divider (TREES, SHRUBS, etc.) ──────────────
#let group-header(title) = {
  pagebreak(weak: true)
  block(
    width: 100%,
    fill: forest,
    inset: (x: 16pt, y: 12pt),
    below: 0.8em
  )[
    #text(size: 22pt, weight: "bold", fill: white)[#title]
  ]
}


// ── Plant page header (name + latin + image + overview) ──────
// image-file: filename without extension, e.g. "maple"
// body: overview content block
#let plant-header(name, latin, image-file, body) = {
  grid(
    columns: (1fr, 112pt),
    column-gutter: 16pt,
    align: top,
    [
      #text(size: 19pt, weight: "bold", fill: forest)[#name] \
      #v(0.5em, weak: true)
      #text(size: 10.5pt, style: "italic", fill: forest-light)[#latin]
      #v(7pt, weak: true)
      #text(size: 10.5pt, fill: text-main)[#body]
    ],
    image("images/" + image-file + ".jpg", width: 100%)
  )
  v(0.5pt)
  line(length: 100%, stroke: 0.4pt + luma(210))
  v(2pt)
}


// ── Callout boxes ────────────────────────────────────────────
#let callout(title, body, bg: amber-bg, border: amber) = {
  v(0.5em)
  block(
    width: 100%,
    inset: (left: 12pt, top: 8pt, bottom: 8pt, right: 10pt),
    fill: bg,
    stroke: (left: 3.5pt + border),
    above: 0.4em,
    below: 0.4em,
    radius: (right: 3pt)
  )[
    #text(weight: "bold", fill: border)[#title]
    #h(0.4em)
    #body
  ]
  v(0.5em)
}

#let warning-callout(title, body) = callout(
  title, body,
  bg: amber-bg,
  border: amber
)

#let info-callout(title, body) = callout(
  title, body,
  bg: rgb("#EFF7EF"),
  border: forest
)

#let danger-callout(title, body) = callout(
  title, body,
  bg: rgb("#FFF0EE"),
  border: red-warn
)


// ── Tinted rule / spacer ─────────────────────────────────────
#let section-rule = {
  v(0.3em)
  line(length: 100%, stroke: 0.5pt + luma(210))
  v(0.3em)
}


// ── Standard table style ─────────────────────────────────────
// Usage: wrap #table(...) in #styled-table[...]
// Or use the fill/stroke values directly.
#let tbl-fill(x, y) = {
  if y == 0 { forest }
  else if calc.odd(y) { cell-green }
  else { white }
}
#let tbl-stroke = 0.4pt + border-grey
#let tbl-header-text(content) = text(
  fill: white, weight: "bold", size: 10pt, content
)


// ── Soil status colour helper ────────────────────────────────
#let status-color(s) = {
  if s.starts-with("⚠") { status-warn }
  else if s.starts-with("✓") { status-ok }
  else if s == "HIGH" { status-high }
  else { text-main }
}


// ── Task grid helpers ────────────────────────────────────────
#let tg-do = "◆"
#let tg-month-cols = range(12).map(_ => 1fr)

// Active task cell (green background, dark symbol)
#let tg-active = table.cell.with(
  fill: active-cell,
  align: center
)
// Inactive cell
#let tg-empty = table.cell.with(align: center)

// Category row spanning all 13 columns
#let tg-category(label) = table.cell(
  colspan: 13,
  fill: cat-cell
)[
  #text(weight: "bold", fill: forest, size: 9.5pt)[#label]
]

// Build a task row from label + 12-element bool array
#let tg-row(label, months) = {
  let cells = ([#text(size: 9pt)[#label]],)
  for active in months {
    if active {
      cells += (tg-active[#text(fill: forest, weight: "bold", size: 9pt)[#tg-do]],)
    } else {
      cells += (tg-empty[#text(fill: luma(210), size: 8pt)[·]],)
    }
  }
  cells
}
