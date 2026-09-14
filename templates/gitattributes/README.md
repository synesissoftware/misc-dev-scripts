# `.gitattributes` templates <!-- omit in toc -->


**Status:** Canonical copies live here (migrated from former **misc-config-scripts** `gitattributes/` catalogs; that tree was removed in **misc-config-scripts** **0.9.0**).


Drop-in root **`.gitattributes`** files for GitHub-hosted repositories, organised by primary language.

These templates were written from first principles using public documentation and community templates — **not** from local Synesis / related repositories.


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
- [Shared baseline](#shared-baseline)
- [What is intentionally omitted](#what-is-intentionally-omitted)


## Formatting conventions in these files

* Comment header naming the language and citing primary sources;
* Section comments (`# --- … ---`) grouping related patterns;
* Within each section, patterns are listed in **lexicographic** order;
* One pattern per line; attributes space-separated after the pattern.


## How the contents were chosen

1. **GitHub Docs — line endings** — Start every file with `* text=auto` so Git detects text vs binary and normalises text to LF in the repository ([Configuring Git to handle line endings](https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings)).
2. **git-scm — `gitattributes(5)`** — Attach built-in `diff=` drivers where Git provides them (`cpp`, `csharp`, `golang`, `python`, `ruby`, `rust`, `markdown`, `html`, `css`, …) for better hunk headers.
3. **Community templates** — Incorporate ecosystem patterns from [gitattributes/gitattributes](https://github.com/gitattributes/gitattributes) (`Common`, `C++`, `CSharp`, `Python`, `Rust`, `Go`, `Web`).
4. **GitHub Linguist** — Mark common generated / vendored / documentation paths with `linguist-generated`, `linguist-vendored`, `linguist-documentation`, and fix highlighting with `linguist-language` where needed ([Linguist overrides](https://github.com/github-linguist/linguist/blob/main/docs/overrides.md)).
5. **Modern GitHub practice over historical oddities** — e.g. Go uses `*.go text eol=lf` (gofmt-friendly on Windows), not the golang/go-repo `*.go -text` special case, unless you are contributing to that specific tree.


## How to use

Copy the appropriate file to the target repository root as **`.gitattributes`**:

```sh
cp templates/gitattributes/<language>/.gitattributes /path/to/repo/.gitattributes
```

Prefer the language-specific template that matches the project’s primary language; use **generic** only for multi-language trees or when no single language dominates.

After adding or changing `.gitattributes` in an existing repo, renormalise if needed:

```sh
git add --renormalize .
```

Linguist overrides apply only after the `.gitattributes` file is **committed**.


## Language templates

### c and cxx

Folders: **`c/`**, **`cxx/`**.

* **Source**: C/C++ extensions as `text diff=cpp` (Git’s `cpp` driver covers both languages).
* **Build**: Makefiles, Autotools, CMake as text; `configure` forced `eol=lf`.
* **Binary**: objects, static/shared libraries, executables, precompiled headers.
* **Linguist**: `build/` / `cmake-build-*/` as `linguist-generated` if ever committed (prefer `.gitignore`).

### csharp

Folder: **`c#/`**.

* **Source**: `*.cs` / `*.csx` with `diff=csharp`; Razor/CSHTML with `diff=html`.
* **Solutions / projects**: `*.sln`, `*.csproj`, etc. use `eol=crlf` (Visual Studio expectation; matches gitattributes/CSharp template and GitHub Docs examples).
* **Linguist**: `bin/` / `obj/` generated; `packages/` vendored.

### generic

**Union** of every language-specific template (all source, config, script, binary, and Linguist rules). Prefer a single-language template when possible to avoid irrelevant patterns.

### go

* **Source**: `*.go text eol=lf diff=golang` plus `go.mod` / `go.sum` / `go.work*` with LF (avoids gofmt line-ending churn on Windows).
* **Note**: The [gitattributes Go template](https://github.com/gitattributes/gitattributes/blob/master/Go.gitattributes) uses `*.go -text` for the golang/go contribution style; this template follows common **GitHub-hosted** Go apps/libraries instead.
* **Linguist**: `vendor/` as `linguist-vendored`.

### javascript

* **Source**: JS/TS/JSX/TSX/Vue with LF; CSS/HTML with their diff drivers.
* **Lockfiles / maps**: kept as text but `-diff` to reduce noise (`package-lock.json`, `yarn.lock`, `pnpm-lock.yaml`, `*.map`).
* **Linguist**: minified assets and `dist/` / `build/` generated; `node_modules/` vendored; `tsconfig.json` / `jsconfig.json` as `JSON-with-Comments`.

### python

* **Source**: `*.py` / stubs / Cython with `diff=python`; notebooks LF.
* **Binary**: bytecode `*.pyc` / `*.pyo` as `binary export-ignore`; wheels, extensions, pickles as binary.
* **Linguist**: `__pycache__`, type/test/linter caches, `dist/`, `*.egg-info` generated.

### ruby

* **Source**: `*.rb`, gemspecs, Rakefile/Gemfile family with `diff=ruby` and LF.
* **Lock**: `Gemfile.lock` as text `-diff`.
* **Linguist**: Bundler vendor paths vendored; `coverage/` / `pkg/` generated; `doc/` documentation.

### rust

* **Source**: `*.rs text eol=lf diff=rust`; `Cargo.toml` / `Cargo.lock` / toolchain files as text.
* **Linguist**: `target/` as `linguist-generated` if committed (normally gitignored).

### zig

* **Source**: `*.zig` / `*.zon` / `build.zig*` as text LF (no built-in Git `diff=` driver for Zig).
* **Linguist**: `.zig-cache/`, `zig-cache/`, `zig-out/` generated if committed (normally gitignored per ziglang conventions).


## Layout

| Path | Role |
|---|---|
| **c#/.gitattributes** | C# / .NET projects |
| **c/.gitattributes** | C-primary projects |
| **c_cxx/.gitattributes** | Mixed C / C++ projects |
| **cxx/.gitattributes** | C++-primary projects |
| **generic/.gitattributes** | Union of all language templates |
| **go/.gitattributes** | Go projects |
| **javascript/.gitattributes** | JavaScript / TypeScript projects |
| **python/.gitattributes** | Python projects |
| **ruby/.gitattributes** | Ruby projects |
| **rust/.gitattributes** | Rust projects |
| **zig/.gitattributes** | Zig projects |

Templates live under **`templates/gitattributes/`** (not `.gitattributes/`) so they do not collide with a repository’s own root `.gitattributes` file.


## Shared baseline

Every template includes:

* `* text=auto`;
* shell scripts with `eol=lf`, Windows scripts (`.bat` / `.cmd` / `.ps1`) with `eol=crlf`;
* common docs / licence / changelog names as text;
* common image and archive binaries;
* `.gitattributes` / `.gitignore` as text.


## What is intentionally omitted

* Project-specific `linguist-language=` remaps (e.g. forcing headers to C vs C++);
* Absolute paths or machine-local patterns;
* Treating SVG as binary (left as text, matching Common/Web templates);
* Relying on Linguist alone for build dirs that should be **gitignored** instead;
* Custom `merge=` drivers (e.g. Rails `schema.rb merge=ours`) that need local git config.


<!-- ########################### end of file ########################### -->
