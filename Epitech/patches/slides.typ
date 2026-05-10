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
  == Some history

  #set text(size: 20pt)
  Apparently, patches have existed since punch cards!

  #grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [
      #set align(horizon)
      You would cut the right part and replace it with the patched one!
    ],
    figure(
      image("assets/punch-card.webp", width: 200pt)
    )
  )
]

#slide[
  == Some history

  Patches always existed in two forms:
  - Source code patching
  - Binary patching

  We're going to be only talking about source code patching.
]

#slide[
  == Some #strike("git") history

  How modifications to the Linux kernel work:
  #set text(size: 20pt)
  - Create modifications to the kernel
  - Generate the patch using `diff(1)` and `patch(1)`
  - Send the .patch files to maintainers via email

  #set text(size: 25pt)
  The Linux kernel was using BitKeeper before git which simplified this flow.

  #set align(center)
  #image("assets/bitkeeper-logo.webp")
]

#slide[
  == Some #strike("git") history

  Problems with BitKeeper:
  - Slow (most CVS took >30s to apply patches)
  - Proprietary license

  This made Linus create git once BitKeeper revoked the Kernel's license.
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
  == Sources

  #set text(size: 17pt)
  - https://en.wikipedia.org/wiki/Git
  - https://en.wikipedia.org/wiki/Patch_(computing)
  - https://fr.wikipedia.org/wiki/Fichier:Bitkeeper-logo.png
  - https://docs.kernel.org/process/submitting-patches.html
]

#slide[
  == Slides

  #set align(horizon)
  #set align(center)
  https://github.com/hugoarnal/talks
]
