# `.editorconfig` templates <!-- omit in toc -->


Drop-in root **`.editorconfig`** files, organised by primary language.

**Status:** Phase 2 — populated (freelibs exemplars for **python** / **ruby**; synthesized house indent rules for other languages).


## Table of Contents <!-- omit in toc -->

- [How to use](#how-to-use)
- [Layout](#layout)


## How to use

```sh
cp templates/editorconfig/<language>/.editorconfig /path/to/repo/.editorconfig
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
