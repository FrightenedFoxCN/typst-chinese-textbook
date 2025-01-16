#import "boxes.typ": *
#import "fontconfig.typ": *
#import "@preview/indenta:0.0.3": fix-indent
#import "@preview/hydra:0.5.1": hydra

#let chinese_number(num, standalone: false) = if num < 11 {
    ("零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十").at(num)
} else if num < 100 {
  if calc.rem(num, 10) == 0 {
    chinese_number(calc.floor(num / 10)) + "十"
  } else if num < 20 and standalone {
    "十" + chinese_number(calc.rem(num, 10))
  } else {
    chinese_number(calc.floor(num / 10)) + "十" + chinese_number(calc.rem(num, 10))
  }
} else {
  panic("Too much chapters!")
}

#let chapter_numbering(nums) = {
    "第" + chinese_number(nums, standalone: true) + "章"
}

#let chinese_numbering(..nums, location: none) = {
    if nums.pos().len() == 1 {
        chapter_numbering(nums.pos().first())
    } else {
        numbering("1.1", ..nums)
    }
}

#let makecontent() = [
  #show outline: set heading(
    numbering: (..nums) => "",
  )
  #show heading: it => outlinebox(it)
  #outline(title: [目录])
  #pagebreak()
  #counter(heading).update(0)
]

#let conf(doc) = {
  set heading (
    numbering: chinese_numbering
  )

  show heading: it => headingbox(it)

  show outline.entry.where(level: 1): it => {
    v(21pt)
    box(height: 1em, strong(it.body))
  }

  set outline(
    depth: 2,
    indent: 2em
  )

  show outline.entry: it => {
    text(size:12pt, it)
  }

  set page(
    header: context align({
      if calc.odd(here().page()) {
        right
      } else {
        left
      }},
      emph(hydra(1, skip-starting: false)),
    ),
  )

  set text(font: text-fonts)

  show emph: set text (font: emph-fonts,)
  show strong: set text (font: bold-fonts)
  show raw: set text (font: code-fonts)

  set enum(indent: 2em)
  set list(indent: 2em,)

  set par(
    leading: 1em,
    first-line-indent: 2em
  )

  set footnote(numbering: "①")

  show figure: set block(breakable: true)

  show ref: it => {
    let eq = math.equation
    let el = it.element
    if el != none {
      if el.func() == heading {
        link(el.location(), [#numbering(el.numbering, ..counter(heading).at(el.location()))])
      } else if el.func() == figure {
        link(el.location(), [#el.supplement #numbering(el.numbering, ..el.counter.at(el.location()))])
      }
    } else {
      it
    }
  }

  show raw.where(block: true): ctx => box(
    fill: blue.lighten(80%),
    outset: (y: 5pt, x: 10pt),
    inset: (y: 5pt),
    width: 90%,
    grid(columns: (2em, 1fr),
      grid.vline(x: 0, stroke: blue + 0.5pt, position: end),
      column-gutter: 7pt,
      stroke: (x, y) => if x == 1 {
        (bottom: (
          paint: white,
          thickness: 0.5pt
        ))
      },
      row-gutter: 5pt, 
      ..ctx.lines.map(
        line => (
          [#line.number], 
          box(height: 12pt, line)
        )
      ).flatten()),
  )
  
  doc
}