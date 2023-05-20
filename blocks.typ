

#let color_block(bg_color: white, text_color: black, has_stroke: true, content) = {
  set text(fill: text_color)
  block(
    stroke: if has_stroke {text_color} else {none},
    fill: bg_color,
    inset: 10pt,
    radius: 4pt,
    width: 100%,
    content
  )
}

#let success_block(content) = {
  color_block(
    bg_color: rgb("#f0fdf4"),
    text_color: rgb("#16a34a"),
    content
  )
}

#let info_block(content) = {
  color_block(
    bg_color: rgb("#f0f9ff"),
    text_color: rgb("#0284c7"),
    content
  )
}

#let warning_block(content) = {
  color_block(
    bg_color: rgb("#fefce8"),
    text_color: rgb("#ca8a04"),
    content
  )
}

#let error_block(content) = {
  color_block(
    bg_color: rgb("#fef2f2"),
    text_color: rgb("#dc2626"),
    content
  )
}

#let note_block(content) = {
  set text(style: "italic", fill: rgb("#4b5563"))
  content
}

#let cite_block(content, source: none) = {
  set par()
  set text(style: "italic", weight: "bold", size: 12pt)
  block(
    inset: (x: 20pt, y: 10pt),
    radius: 4pt,
    width: 100%,
    [
      #content

      #align(right, if source == none {} else {text(weight: "regular", [-- #source])})
    ]
  )
}


#let main_block(font: "Arial", it) = {
  // font
  set text(
    font: font
  )


  // heading
  show heading.where(level: 1): it => {
    set text(size: 20pt, weight: "bold")
    v(0.3em)
    it
    v(0.5em)
  }
  show heading.where(level: 2): it => {
    set text(size: 16pt, weight: "bold")
    v(0.3em)
    it
    v(0.3em)
  }
  show heading.where(level: 3): it => {
    set text(size: 14pt, weight: "regular")
    v(0.3em)
    it
    v(0.3em)
  }
  show heading.where(level: 4): it => {
    set text(size: 12pt, weight: "regular")
    v(0.3em)
    it
    v(0.1em)
  }

  // code
  show raw: set text(
    font: ("Cascadia Mono", "Consolas")
  )
  show raw.where(block: false): box.with(
    fill: luma(245),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
    )
  show raw.where(block: true): block.with(
    fill: luma(245),
    inset: 10pt,
    radius: 4pt,
    width: 100%
  )

  // link
  show link: underline

  it
}