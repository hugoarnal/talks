#import "@preview/polylux:0.4.0": *
#import "@preview/h-graph:0.1.0": *

#set page(paper: "presentation-16-9")
#set text(size: 25pt, font: "JetBrains Mono")

#slide[
  #set align(horizon)

  == Rebase after base

  Learn how to master `git rebase`

  Hugo ARNAL
]

#slide[
  == What is a rebase?

  #set align(horizon)
  #set align(center)
  #set text(size: 100pt)
  🤔🤔🤔
]

#slide[
  == Commits

  #show raw.where(lang: "graph"): enable-graph-in-raw(tree-render)
  ```graph
  1-2;
  2-3;
  3-4;
  4-5;
  ```
  From left -> right
]

#slide[
  == Branches

  #image("./assets/branches.webp")
]

#slide[
  == Rebase

  #image("./assets/branches-rebase.webp")
]

#slide[
  == Merging

  #image("./assets/branches-merge.webp")
]

#slide[
  == Full control with interactive mode

  #set text(size: 17pt)
  `git rebase -i main~50` (50 last commits since `main`)

  #set align(center)
  #image("./assets/rebase-interactive-1.webp", height: 280pt)
]

#slide[
  == Full control with interactive mode

  #set align(horizon)

  - Step 1: do not ```rust panic!()```

  - Step 2: `git config --global core.editor vim`

  - Step 3: let's analyse this
]

#slide[
  == Full control with interactive mode

  #set text(size: 20pt)
  #grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    box([
      - Your commits are listed from oldest to newest
      - By default, they're all in "pick" mode: essentially does not touch the commit.
    ]),
    figure(
      image("./assets/rebase-interactive-1.webp", height: 270pt)
    )
  )
]

#slide[
  == Why use `git rebase`?

  - Cleaner git history (prevent merge commits)
  #set align(center)
  #image("./assets/amazed.webp", width: 150pt)
]

#slide[
  == Why use `git rebase`?

  - More control over your git history

]

#slide[
  == Sources

  #set align(horizon)
  - https://git-scm.com/cheat-sheet.pdf
  - https://git-rebase.io
  - https://learngitbranching.js.org
  - https://jvns.ca/blog/2023/11/06/rebasing-what-can-go-wrong-
]

#slide[
  == Slides

  #set align(horizon)
  #set align(center)
  https://github.com/hugoarnal/talks
]
