#import "@preview/polylux:0.4.0"
#import "colors.typ"

// Simple side by side landing slide
#let landing-slide(content, image) = {
  set page(paper: "presentation-16-9")

  polylux.slide([
    #set align(horizon)

    #grid(
      columns: (1fr, auto),
      column-gutter: 1em,
      content,
      figure(
        image
      )
    )
  ])
}

// Simple slide
#let slide(body) = {
  set page(paper: "presentation-16-9")

  polylux.slide(body)
}
