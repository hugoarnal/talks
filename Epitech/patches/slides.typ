#import "@preview/polylux:0.4.0": *
#import "@preview/h-graph:0.1.0": *

#set page(paper: "presentation-16-9")
#set text(size: 25pt, font: "JetBrains Mono")

#slide[
  #set align(horizon)

  #grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [
      == 0001-workshop.patch

      Using git the "good old way"!

      Hugo ARNAL
    ],
    // TODO: very bad photoshop of clothes with a patch of the Git logo
    //
    // figure(
    //   image("./assets/git-patch-jacket.webp", height: 320pt)
    // )
  )
]

#slide[
  == Workshop

  #set text(size: 20pt)
  ctc: complete a captcha by getting all the letters dropping from the top of the screen.

  #grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [
      #set align(center)
      #image("./assets/ctc-example.webp", width: 200pt)
    ],
    [
      Composed of:
      - a very simple frontend in HTML/JS
      - Rust backend
    ]
  )

  #set align(center)
  #set text(size: 25pt)
  - `git clone https://github.com/hugoarnal/ctc.git`
]

#slide[
  == Workshop

  #set text(20pt)
  Goals:
  - Create a new branch and checkout to it
  - Create a commit hard coding the WIDTH and HEIGHT values to 300 and 250. (JS)
  - Remove all colors #underline(text("except", weight: "bold")) red (JS)
  - Make Captcha length 4 instead of 7 (Rust & JS)
  - Unhard code the WIDTH & HEIGHT variables #text("(must use a rebase method)", weight: "bold")
  - Apply the given patch #text("(0001-ref-separate-Fruit-Pad-from-script.js.patch)", size: 12pt)
]

#slide[
  == Slides & Source

  #set align(horizon)
  #set align(center)
  https://github.com/hugoarnal/talks
]
