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
      == Rebase after base

      Learn how to master `git rebase`

      Hugo ARNAL
    ],
    figure(
      image("./assets/gd-git.webp", height: 320pt)
    )
  )
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
  #set align(center)
  #set align(horizon)
  #set text(size: 70pt)
  == ⚠️ Warning ⚠️
  #set text(size: 25pt)
  Using `git rebase` will lead to use `git push --force` which is EXTREMELY dangerous.
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
    [
      #set align(horizon)
      - Your commits are listed from oldest to newest
      - By default, they're all in "pick" mode: essentially does not touch the commit.
    ],
    figure(
      image("./assets/rebase-interactive-1.webp", height: 320pt)
    )
  )
]

#slide[
  == Full control with interactive mode

  #set text(size: 20pt)
  #grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [
      #set align(horizon)
      - Change the content of a commit by replacing "pick" with "edit"
    ],
    figure(
      image("./assets/rebase-interactive-edit.webp", height: 320pt)
    )
  )

  #pagebreak()
  #set align(center)

  #image("./assets/rebase-interactive-edit-amend.webp", height: 320pt)

  #pagebreak()

  Success!
  #image("./assets/rebase-interactive-edit-log.webp", height: 270pt)
]

#slide[
  == Full control with interactive mode

  - Squash commits to clean your history

  ```sh
  git checkout -b squash
  for c in H e l l o ' ' w o r l d; do
      echo "$c" >> squash.txt
      git add squash.txt
      git commit -m "Add '$c' to squash.txt"
  done
  ```

  #set text(size: 10pt)
  Source: git-rebase.io
  #set text(size: 25pt)

  #pagebreak()

  #set text(size: 20pt)
  - Replacing all picks (except the first one) with squash

  ```sh
  pick 1e85199 Add 'H' to squash.txt
  squash fff6631 Add 'e' to squash.txt
  squash b354c74 Add 'l' to squash.txt
  squash 04aaf74 Add 'l' to squash.txt
  squash 9b0f720 Add 'o' to squash.txt
  squash dc158cd Add ' ' to squash.txt
  squash dfcf9d6 Add 'w' to squash.txt
  squash 7a85f34 Add 'o' to squash.txt
  squash c275c27 Add 'r' to squash.txt
  squash a513fd1 Add 'l' to squash.txt
  squash 6b608ae Add 'd' to squash.txt
  ```

  - This will create a singular commit with all the content from the other commits.
]

#slide[
  == Bunch of other features

  #set align(horizon)
  - Using `git rebase --autosquash`
  - Splitting one commit into several
  - Reordering commits
  - Resolving conflicts
]

#slide[
  == Why use `git rebase`?

  - Cleaner git history (prevent merge commits)
  #set align(center)
  #image("./assets/amazed.webp", width: 150pt)
]

#slide[
  == Why use `git rebase`?

  #set align(horizon)
  - More control over your git history
]

#slide[
  == When you should NOT use `git rebase`

  #set align(horizon)
  - Two people working on the same branch
  Pushing with `--force` might delete some work

  An alternative to it is `git push --force-with-lease` but retains dangerous
]

#slide[
  == When you should NOT use `git rebase`

  #set align(horizon)
  - Rewriting the history of an already pushed branch
  I recommend to prevent this by setting rules on your branches (unfortunately can't be done on Epitech repos, except for mirrors).
]

#slide[
  == Going further?

  #set align(horizon)
  `git history` landing in Git 2.54!

  A safer way to just modify commit messages, without rebasing.

  #link("https://front-end.social/@stefan/116441339289854563")[#underline("See an example")]
]

#slide[
  == Sources

  #set align(horizon)
  #set text(15pt)
  Useful tutorials:
  - https://git-rebase.io
  - https://learngitbranching.js.org

  #linebreak()

  - https://git-scm.com/cheat-sheet.pdf
  - https://jvns.ca/blog/2023/11/06/rebasing-what-can-go-wrong-
  - https://github.blog/open-source/git/highlights-from-git-2-54/
  - https://git-scm.com/docs/git-history/2.54.0
  - https://front-end.social/@stefan/116441339289854563
]

#slide[
  == Slides

  #set align(horizon)
  #set align(center)
  https://github.com/hugoarnal/talks
]
