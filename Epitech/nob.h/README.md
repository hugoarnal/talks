# nob.h
(aussi appelé "Compiler du C en C (sans Makefiles et sans build.sh)")

<!-- TODO: relire -->

(Si le .md de ce talk est suivi, oubliez pas de clone [nob.h](https://github.com/tsoding/nob.h) dans le dossier nob.h à la racine de ce talk)

# Introduction

L'autre jour en scrollant sur youtube je suis tombé sur [cette vidéo](https://www.youtube.com/watch?v=D1bsg8wkZzo) d'un youtubeur que j'apprécie bien qui s'appelle Tsoding.

"I'm building C with C without CMake" (oui c'est comme le nom du talk)

Dans cette vidéo, il explique comment fonctionne le build system qu'il a crée.
Son build système qui s'appelle nob.h pour nobuild.h.

Et j'ai apprécié l'idée donc je décide d'en parler aujourd'hui.

# Histoire de nob.h

nob.h part à la base de [nobuild](https://github.com/tsoding/nobuild) qui est aussi fait par Tsoding.

<!-- TODO: continue -->

# Fonctionnement d'un projet standard / Hello world

Essayons de compiler notre projet avec un Makefile en premier:

(Voir [examples/hello_world/makefile](./examples/hello_world/makefile))

Le Makefile est très simple, il y a juste besoin de faire `make` et notre projet est compilé sans aucun problème.

Maintenant pour l'exexmple avec nob.

(Voir [examples/hello_world/nob](./examples/hello_world/nob)

Une fois que nob.c est écrit, on peut compiler nob pour ensuite l'éxécuter:
- `cc -o nob nob.c`
- `./nob`

et notre projet est compilé.

# Fonctionnement d'un projet plus complexe

<!-- TODO: fonctionnement d'un projet plus avancé, maybe raylib hello world avec plusieurs fichiers etc? -->

# Pourquoi faire tout ça?
(La plupart de ce que je vais dire provient du [README.md de nob.h](https://github.com/tsoding/nob.h/blob/main/README.md))

### Philosophie

L'idée principale partagée par nob est qu'un projet C n'aurait besoin de rien d'autre qu'un compilateur C pour être build. Il suffirait donc de compiler le fichier `nob` pour pouvoir build le reste.

Tsoding voulait se débarrasser de GNU Make ou CMake ou même des scripts shell pour pouvoir compiler ses différents projets en C. C'est pour ça qu'il a crée nob.

D'ailleurs, même lorsqu'il code dans un autre langage tel que le D dans [ce stream](https://www.youtube.com/watch?v=Gj5310KnUTQ), l'une des premières choses qu'il va essayer de faire c'est de faire une minuscule version de nob.

### Avantages et désavantages:

#### `Avantages:`
- Portabilité due à l'utilisation du C
- On finit donc par écrire le même langage à travers tout le projet, ce qui peut permettre de la réutilisation de code à travers le projet.
- Ecrire en C

#### `Désavantages:`
- Faut être bon en C
- En dehors des projets C/C++, ça n'as pas vraiment de vrai utilité.
- Ecrire en C

### "Rétrocompatibilité"

Un avantage que je n'ai pas abordé dans la partie d'avant c'est que si on prend un Makefile classique, compilé avec une version de GNU Make spécifique (par exemple, la version 2.0)
et que dans une autre version de GNU Make (par exemple, la version 3.0), il y a une feature qui disparait de GNU Make et bien notre projet ne compilera plus.

Avec nob, ce problème n'existe pas car si on veut build notre projet, on inclut directement une version spécifique de `nob.h`.
Par exemple, si mon projet utilise une feature disponible dans la version 1.18 mais que dans la version 1.19 elle est supprimée, il compilera quand même car notre version de nob n'est pas dépendante d'un outil externe.

# Est-ce une bonne idée? (Conclusion)

`Réponse courte`: non.

`Réponse longue`: peut-être.

Merci à tous d'avoir suivi.

Plus sérieusement, nob.h (ainsi que sa philosophie) ne sont pas mauvais et ces idées sont mêmes bien executées.

Cependant, nob.h reste extrêmement peu documenté dût à peu d'utilisations, peu de documentation écrite (même si le code est assez bien commenté).

Mais l'idée n'est pas mauvaise si vous aimez l'idée d'avoir seulement le compilateur C afin de pouvoir compiler vos programmes ainsi que l'idée de portabilité que offre nob.

Il reste quand même une meilleure idée d'utiliser un Makefile ou bien un bon vieux script shell pour pouvoir compiler simplement votre projet car la plupart des gens qui s'intéressent à votre projet auront probablement eu affaire à ces outils par le passé.
Et aussi vous aurez moins de mal à débugger car ces outils sont connus.

<!-- TODO: continue -->
