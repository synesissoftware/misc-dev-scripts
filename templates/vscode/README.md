# VS Code `settings.json` templates <!-- omit in toc -->


**Status:** Canonical copies live here (migrated from former **misc-config-scripts** `settings.json/` catalogs; that tree was removed in **misc-config-scripts** **0.9.0**).


Drop-in workspace settings for Synesis / related projects, organised by primary language.


## Table of Contents <!-- omit in toc -->

- [Formatting conventions in these files](#formatting-conventions-in-these-files)
- [How the contents were chosen](#how-the-contents-were-chosen)
- [How to use](#how-to-use)
- [Language templates](#language-templates)
  - [c and cxx](#c-and-cxx)
  - [csharp](#csharp)
  - [generic](#generic)
  - [go](#go)
  - [javascript](#javascript)
  - [python](#python)
  - [ruby](#ruby)
  - [rust](#rust)
  - [zig](#zig)
- [Layout](#layout)
- [Shared house style](#shared-house-style)
- [What is intentionally omitted](#what-is-intentionally-omitted)


## Formatting conventions in these files

These JSONC-style files follow the house layout used across the corpus:

* **Tabs** for indentation;
* **Trailing commas** on objects and on non-ruler arrays (VS Code allows this);
* **`editor.rulers` arrays closed and compact** on one line, e.g. `"editor.rulers": [ 60, 76 ]`, with **no** trailing comma inside the list;
* **Key order**: language-specific blocks (`[…]`) first, lexicographically among themselves; then all other top-level keys lexicographically; keys within every nested object are lexicographic.


## How the contents were chosen

1. **Corpus** — Collected `.vscode/settings.json` (and similar) under `~/dev/synesissoftware`, `~/dev/sistools`, `~/dev/dev-tools`, and `~/dev/sis`, classified by project language (name markers such as `*.Rust` / `*.Go`, plus source-file counts).
2. **Consensus** — For each language, kept settings that appeared consistently (indent, rulers, trim, cmake-on-open, rust-analyzer / gopls / Pylance knobs already in use).
3. **Best practice** — Filled formatter, LSP, and debugger gaps from current official docs (Microsoft VS Code language pages, Shopify Ruby LSP, golang/vscode-go, rust-analyzer, Astral Ruff, zigtools ZLS, C# Dev Kit), not from one-off project hacks.
4. **Synesis constraints** — Preserved house choices that conflict with naive “enable everything” defaults, e.g. `rust-analyzer.cargo.noDefaultFeatures`, clang-format fallback **none** (format only when a `.clang-format` exists), and compact `editor.rulers` lists.

Project-specific values (linked Cargo projects, feature lists, absolute tool paths, `compile_commands` directories) were **not** copied into the templates.


## How to use

Copy the appropriate file to the target repository as **`.vscode/settings.json`** (create `.vscode/` if needed):

```sh
cp templates/vscode/<language>/settings.json /path/to/repo/.vscode/settings.json
```

Prefer the language-specific template that matches the project’s primary language; use **generic** only for multi-language trees or when no single language dominates. Use **c_cxx** when shipping the mixed C / C++ settings copy (identical to **cxx** / **c** today).


## Language templates

### c and cxx

Folders: **`c/`**, **`c_cxx/`**, **`cxx/`**.

* **Debugger**: Breakpoints allowed everywhere (headers / macros); concrete debug configs stay in **launch.json** (`cppdbg` / CodeLLDB).
* **Extra**: Large `files.associations` map so extensionless libc++ / MSVC STL headers open as C++ (from the C/C++ corpus).
* **Formatter**: Microsoft C/C++ extension (`ms-vscode.cpptools`) with **clang-format**, `C_Cpp.clang_format_style`: `file`, fallback **`none`** so saves do not rewrite style without a project `.clang-format`.
* **LSP / IntelliSense**: `C_Cpp.intelliSenseEngine`: `default`, squiggles and enhanced colourisation on; defaults **c17** / **c++17**.

`c` and `cxx` are intentionally almost identical; both ship `[c]` and `[cpp]` blocks because mixed trees are normal.

### csharp

Folder: **`c#/`**.

* **Debugger**: `csharp.debug.justMyCode`, console, step filtering (official `csharp.debug.*` settings). Launch details remain in **launch.json** / `launchSettings.json`.
* **Formatter / LSP**: C# extension / Dev Kit (`ms-dotnettools.csharp`), format on save, organise imports on format (`dotnet.*`). Prefer **dotnet.*** over legacy OmniSharp-only knobs.

### generic

**Union** of every language-specific template:

* all language blocks (`[c]`, `[cpp]`, `[go]`, `[python]`, …);
* all tool namespaces (`C_Cpp.*`, `gopls`, `python.*`, `ruff.*`, `rust-analyzer.*`, `rubyLsp.*`, `zig.*`, …);
* merged `files.exclude` and the C/C++ `files.associations` map.

Use when a workspace spans multiple languages or the primary language is unclear. Prefer a single-language template when possible to avoid loading irrelevant tool settings.

### go

* **Debugger**: `go.delveConfig` for Delve / dlv-dap.
* **Formatter**: `go.formatTool`: **`default`** (gopls — current vscode-go recommendation), with `formatting.gofumpt` enabled.
* **Lint**: `golangci-lint` on workspace save (`--fast`), matching the existing Go corpus.
* **LSP**: `go.useLanguageServer`, gopls semantic tokens / placeholders, vulncheck on imports, common inlay hints.

### javascript

* **Debugger**: `debug.javascript.autoAttachFilter`: `smart`.
* **Formatter**: Prettier (`esbenp.prettier-vscode`) on save for JS/TS (and React variants).
* **Lint**: ESLint validate + `source.fixAll.eslint` on save.
* **LSP**: Workspace TypeScript SDK (`typescript.tsdk`), auto-imports, update imports on file move.

### python

* **Debugger**: `python.debugpy.debugJustMyCode`: **true**.
* **Formatter / lint**: Ruff extension as default formatter; fix-all and organise-imports on save; `ruff.nativeServer`: **on**.
* **Hygiene**: exclude `__pycache__` / swap files.
* **LSP**: Pylance (`python.languageServer`), standard type checking, workspace diagnostics, selected inlay hints.

### ruby

* **Debugger**: use Ruby LSP `launch.json` configs (`type`: `ruby_lsp`); no extra debugger keys required in settings.
* **Formatter / LSP**: Shopify **Ruby LSP** only — the official recommended `[ruby]` block (format on save/type, semantic highlighting) plus `rubyLsp.formatter`: **`auto`** (RuboCop / Syntax Tree from the Gemfile).
* **Not in workspace templates**: `rubyLsp.rubyVersionManager` and executable/Gemfile path overrides (user/machine scope; auto-detect is preferred).

### rust

* **Cargo features**: `noDefaultFeatures`: **true** and empty `features` list — matches Synesis libraries with mutually exclusive features (unlike the common `"all"` blog default).
* **Debugger**: CodeLLDB (`rust-analyzer.debug.engine`), `debug.allowBreakpointsEverywhere` (required for rust-analyzer’s simple debug flow).
* **Formatter**: rust-analyzer → rustfmt, format on save.
* **LSP**: `check.command`: **clippy**, `checkOnSave`, `check.allTargets`; proc macros and build scripts on.

### zig

* **Debugger**: breakpoints everywhere; use CodeLLDB via **launch.json**.
* **Formatter / LSP**: Official Zig extension + ZLS (`zig.zls.enabled`: **on**); format on save; `editor.suggest.insertMode`: **replace**; optional fix-all / organise-imports code actions (zigtools guidance).


## Layout

| Path | Role |
|---|---|
| **c#/settings.json** | C# / .NET projects |
| **c/settings.json** | C-primary projects |
| **c_cxx/settings.json** | Mixed C / C++ (same content as **c** / **cxx**) |
| **cxx/settings.json** | C++-primary projects |
| **generic/settings.json** | Union of all language templates (mixed / unknown) |
| **go/settings.json** | Go projects |
| **javascript/settings.json** | JavaScript / TypeScript projects |
| **python/settings.json** | Python projects |
| **ruby/settings.json** | Ruby projects |
| **rust/settings.json** | Rust projects |
| **zig/settings.json** | Zig projects |


## Shared house style

Every template starts from the same editor hygiene, drawn from the common corpus of Synesis / sistools / related `.vscode/settings.json` files:

* `cmake.configureOnOpen`: **false** (even in non-CMake languages, for consistency when CMake files appear);
* `editor.detectIndentation`: **false** (explicit indent rules win);
* default `editor.insertSpaces`: **false**, `editor.tabSize`: **2** (language blocks override per language);
* `editor.renderWhitespace`: **all**;
* `editor.rulers`: **[ 76 ]** globally; denser rulers inside language blocks where the corpus used them;
* `files.insertFinalNewline`: **true**, `files.trimTrailingWhitespace`: **true**;
* `git.mergeEditor`: **false**.

Auxiliary language blocks (e.g. `[json]`, `[markdown]`, `[shellscript]`, `[toml]`) appear wherever those file types commonly sit beside the primary language.


## What is intentionally omitted

* Absolute paths to compilers, `clangd`, or SDKs;
* `compile_commands.json` / build-directory hints (per-repo);
* Editor chrome (themes, font ligatures, exclusive UI prefs);
* `launch.json` / `tasks.json` (debugging *entry* configs belong there);
* `rust-analyzer.linkedProjects` and concrete `cargo.features` lists.


<!-- ########################### end of file ########################### -->
