# `.vimrc` templates <!-- omit in toc -->


Drop-in root **`.vimrc`** files, organised by primary language.

**Status:** Phase 2 — populated from freelibs language gold (**c** / **cxx** / **c_cxx**, **go**, **python**, **ruby**, **rust**, **c#**, **zig**) plus synthesized **javascript** and **generic**. Do **not** treat this repository’s root **`.vimrc`** as a consumer template — that file is **self** boilerplate for **misc-dev-scripts**.


## Table of Contents <!-- omit in toc -->

- [How to use](#how-to-use)
- [Layout](#layout)


## How to use

```sh
cp templates/vimrc/<language>/.vimrc /path/to/repo/.vimrc
```

Prefer the language-specific template that matches the project’s primary language; use **generic** only for multi-language trees.


## Layout

| Path | Role |
| --- | --- |
| **c/** | C-primary |
| **c#/** | C# / .NET |
| **c_cxx/** | Mixed C / C++ |
| **cxx/** | C++-primary |
| **generic/** | Union / mixed |
| **go/** | Go |
| **javascript/** | JavaScript / TypeScript |
| **python/** | Python |
| **ruby/** | Ruby |
| **rust/** | Rust |
| **zig/** | Zig |


<!-- ########################### end of file ########################### -->
