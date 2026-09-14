# `.vimrc` templates <!-- omit in toc -->


Drop-in root **`.vimrc`** files, organised by primary language.

**Status:** Phase 0 layout plus early Phase 1 seed — **`c_cxx/.vimrc`** holds the preserved Synesis C/C++ gold (moved out of this repository’s root self **`.vimrc`**). Other language directories remain **`.gitkeep`** placeholders until Phase 2. Do **not** treat this repository’s root **`.vimrc`** as a consumer template — that file is **self** boilerplate for **misc-dev-scripts**.


## Table of Contents <!-- omit in toc -->

- [How to use (once populated)](#how-to-use-once-populated)
- [Layout](#layout)


## How to use (once populated)

```sh
cp templates/vimrc/<language>/.vimrc /path/to/repo/.vimrc
```

Prefer the language-specific template that matches the project’s primary language; use **generic** only for multi-language trees. Until Phase 2 completes other languages, **`c_cxx`** is the only seeded consumer template here.


## Layout

| Path | Role |
| --- | --- |
| **c/** | C-primary |
| **c#/** | C# / .NET |
| **c_cxx/** | Mixed C / C++ (**seeded** — Synesis C/C++ gold) |
| **cxx/** | C++-primary |
| **generic/** | Union / mixed |
| **go/** | Go |
| **javascript/** | JavaScript / TypeScript |
| **python/** | Python |
| **ruby/** | Ruby |
| **rust/** | Rust |
| **zig/** | Zig |


<!-- ########################### end of file ########################### -->
