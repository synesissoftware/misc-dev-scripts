# `.gitattributes` templates <!-- omit in toc -->


Drop-in root **`.gitattributes`** files, organised by primary language.

**Status:** Phase 0 — layout only (**`.gitkeep`** placeholders). Until cutover, copy from **misc-config-scripts** `gitattributes/` (frozen: no new language templates there). Content will be migrated here in a later phase.


## Table of Contents <!-- omit in toc -->

- [How to use (once populated)](#how-to-use-once-populated)
- [Layout](#layout)


## How to use (once populated)

```sh
cp templates/gitattributes/<language>/.gitattributes /path/to/repo/.gitattributes
```

Prefer the language-specific template that matches the project’s primary language; use **generic** only for multi-language trees. Use **c_cxx** for mixed native C / C++ trees.


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
