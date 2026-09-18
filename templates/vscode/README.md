# VS Code `settings.json` templates <!-- omit in toc -->


Drop-in workspace **`.vscode/settings.json`** files, organised by primary language.

**Status:** Phase 0 — layout only (**`.gitkeep`** placeholders). Until cutover, copy from **misc-config-scripts** `settings.json/` (frozen: no new language templates there). Content will be migrated here in a later phase as **`templates/vscode/<lang>/settings.json`**.


## Table of Contents <!-- omit in toc -->

- [How to use (once populated)](#how-to-use-once-populated)
- [Layout](#layout)


## How to use (once populated)

```sh
cp templates/vscode/<language>/settings.json /path/to/repo/.vscode/settings.json
```

Prefer the language-specific template that matches the project’s primary language; use **generic** only for multi-language trees. Use **c_cxx** when a mixed native C / C++ settings union is provided.


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
