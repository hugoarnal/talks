#import "../atom-one-dark/lib.typ": *
#show: default-config

#landing-slide(
  [
    = Hello world

    This is my first slide

    (I miss Atom)

    Hugo ARNAL
  ],
  image("Atom_editor_logo.svg", height: 320pt),
)

#slide[
  = Hello world!

  #set align(center)
  #set align(horizon)

  ```c
  #include <stdio.h>

  int main(void)
  {
      printf("Hello world!\n");
  }
  ```
]
