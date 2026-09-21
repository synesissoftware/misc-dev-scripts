# `.gitignore` templates <!-- omit in toc -->


Drop-in root **`.gitignore`** files, organised by primary language.

**Status:** Phase 2 — populated. **c** / **cxx** / **c_cxx** are the historical
Synesis C/C++ ignore union (gold section layout: `"directories (by name)"`, `"directories
(by pattern)"`, `"files (by name)"`, `"files (by pattern)"`). **c#** is the SDK-era Visual
Studio / NuGet / Coverlet / BenchmarkDotNet union in that same layout (unrooted
IDE and artefact dirs; omits **`.vscode/`** so tracked settings survive). Other
language keys remain lean house consensus. Projects may still add local paths
after copying.


## Table of Contents <!-- omit in toc -->

- [How to use](#how-to-use)
- [Layout](#layout)


## How to use

```sh
cp templates/gitignore/<language>/.gitignore /path/to/repo/.gitignore
```

Prefer the language-specific template that matches the project’s primary language; use **generic** only for multi-language trees. Projects may still add local paths after copying.


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
