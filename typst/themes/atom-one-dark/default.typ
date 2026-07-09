#import "colors.typ"

#let dark-theme-config(doc) = [
  #set page(fill: colors.gray)
  #set text(fill: white)

  #doc
]

#let light-theme-config(doc) = [
  #set page(fill: white)
  #set text(fill: black)

  #doc
]

#let text-config(doc) = [
  #set text(size: 25pt, font: "JetBrains Mono")

  #doc
]

#let code-block-config(doc) = [
  #show raw.where(block: true): block.with(
    stroke: colors.blue,
    inset: 10pt,
    radius: 4pt,
  )

  #doc
]

#let default-config(theme: dark-theme-config, doc) = [
  #show: theme
  #show: text-config
  #show: code-block-config

  #doc
]
