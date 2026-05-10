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
  == Example of a patch

  #set text(size: 20pt)
  Left: original source code, right: patch to apply
  #grid(
    columns: (1fr, auto),
    column-gutter: 1em,
    [
      ```c
      #include <stdio.h>

      int main(void)
      {
        printf("Hello world!\n");
      }
      ```
    ],
    [
      ```diff
--- a.c 2026-05-10 16:47:17.250776740 +0200
+++ b.c 2026-05-10 16:47:31.502421173 +0200
@@ -2,5 +2,5 @@

 int main(void)
 {
-    printf("Hello world!\n");
+    puts("This is an example");
 }
      ```
    ]
  )
]

#slide[
  == Why learn patches today?

  #set text(size: 20pt)
  Most #strike("Linux distros") Operating Systems use patches. If you're running an Arch Linux system, some packages you install are patched to work on your system.

  clang requires 3 patches to work (as of 10th May 2026):
  #set text(size: 13pt)
  - `0001-Revert-clang-driver-When-fveclib-ArmPL-flag-is-in-us.patch`
  - `0002-Reapply-CUDA-HIP-Add-a-__device__-version-of-std-__g.patch`
  - `enable-fstack-protector-strong-by-default.patch`

  #set text(size: 20pt)
  rustc requires 8 patches to work (as of 10th May 2026):
  #set text(size: 11pt)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    [
      - `0001-bootstrap-Change-libexec-dir.patch`
      - `0002-bootstrap-Change-bash-completion-dir.patch`
      - `0003-bootstrap-Workaround-for-system-stage0.patch`
      - `0004-compiler-Change-LLVM-targets.patch`
    ],
    [
      - `0005-compiler-Use-ld.lld-by-default.patch`
      - `0006-compiler-Use-target-specific-GCC-linkers.patch`
      - `0007-compiler-Link-riscv64-musl-statically.patch`
      - `0008-compiler-Swap-primary-and-secondary-lib-dirs.patch`
    ]
  )
]

#slide[
  == Why learn patches today?

  You're probably using patched software without even knowing!

  #set text(size: 20pt)
  Most of the newer web browsers (Zen, Helium, Arc...) are patching Firefox or Chromium directly! Using software to automate their patches such as GNU Quilt.

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    figure(image("assets/zen-logo.webp", width: 100pt)),
    figure(image("assets/helium-logo.webp", width: 100pt))
  )
]

#slide[
  == Why learn patches today?

  A dependency you're using isn't working correctly? Patch it!

  #set text(size: 20pt)
  Lots of projects are patching dependencies to assure either a better state or a personalized version of it.
]

#slide[
  == Why learn patches today?

  Some git forges only work on patches.

  #set text(size: 20pt)
  This is the case of Sourcehut which doesn't have the Pull Request system but works via Email Patches and a new interface.

  #set align(center)
  #image("assets/sourcehut-logo.webp")
]

#slide[
  == Patches vs forking

  Forking is taking a repository, making a copy of it then modifying the source code.

  #set text(size: 20pt)
  Why would I use patches instead of just forking?

  Overall, forking is heavy and can make it harder to follow upstream commits.

  #linebreak()

  #set text(size: 15pt)
  I recommand this blog post:

  https://nesbitt.io/2026/05/01/patching-and-forking-in-package-managers.html
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
  - https://github.com/imputnet/helium
  - https://github.com/zen-browser/desktop
  - https://sourcehut.org
]

#slide[
  == Slides

  #set align(horizon)
  #set align(center)
  https://github.com/hugoarnal/talks
]
