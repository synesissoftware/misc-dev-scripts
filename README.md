# misc-dev-scripts <!-- omit in toc -->


Miscellaneous Development Scripts

![Language](https://img.shields.io/badge/language-Bash-blue.svg)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Version](https://img.shields.io/badge/version-0.6.0-blue.svg)](https://github.com/synesissoftware/misc-dev-scripts/blob/master/CHANGES.md)
[![Last Commit](https://img.shields.io/github/last-commit/synesissoftware/misc-dev-scripts)](https://github.com/synesissoftware/misc-dev-scripts/commits/master)
[![CI](https://github.com/synesissoftware/misc-dev-scripts/actions/workflows/ci.yml/badge.svg)](https://github.com/synesissoftware/misc-dev-scripts/actions/workflows/ci.yml)


## Table of Contents <!-- omit in toc -->

- [Introduction](#introduction)
- [Ownership and migration](#ownership-and-migration)
- [Catalogue layout](#catalogue-layout)
- [Shell Scripts](#shell-scripts)
  - [run\_all\_unit\_tests.sh](#run_all_unit_testssh)
- [Project drop-in templates](#project-drop-in-templates)
- [Related projects](#related-projects)
- [Project Information](#project-information)


## Introduction

**misc-dev-scripts** is a catalog of resources intended to be **copied** into Synesis (and related) **project** trees: shell helpers (under **shell-scripts/**) and language-specific project drop-in templates (under **templates/**).

Today the shipped helpers are principally **run_all_unit_tests.sh** variants for **JavaScript**, **Python**, and **Ruby**, with further languages and template families planned. When updating a consumer, cite this repository’s **VERSION** in that project’s **CHANGES.md**.

Sibling project: [**misc-config-scripts**](https://github.com/synesissoftware/misc-config-scripts) (**`.commonrc`** and **`.gitconfig`** only).


## Ownership and migration

**Status: Phase 4 complete — self boilerplate aligned with `templates/` gold where applicable.** **misc-config-scripts** **0.8.2+** ships **`.commonrc`** / **`.gitconfig`** only.

Distinguish **self** boilerplate (this repository’s own root editor/Git files) from **templates** (copied into other projects).

| Kind | **misc-config-scripts** | This repo |
| --- | --- | --- |
| **Self** **`.editorconfig`**, **`.gitattributes`**, **`.gitignore`**, **`.vimrc`**, **`.vscode/settings.json`** | ✅ | ✅ |
| **Templates:** **`.gitconfig`**, **`.commonrc`** | ✅ only | ❌ |
| **Templates:** language-specific **`run_all_unit_tests.sh`**, **`.editorconfig`**, **`.gitattributes`**, **`.gitignore`**, **`.vimrc`**, **`.vscode/settings.json`** | ❌ | ✅ only |


## Catalogue layout

Agreed paths (Phase 0):

```text
misc-dev-scripts/
  shell-scripts/
    run_all_unit_tests/<lang>/run_all_unit_tests.sh
  templates/
    editorconfig/<lang>/.editorconfig
    gitattributes/<lang>/.gitattributes
    gitignore/<lang>/.gitignore
    vimrc/<lang>/.vimrc
    vscode/<lang>/settings.json
```

Language keys (lexicographic): **c**, **c#**, **c_cxx**, **cxx**, **generic**, **go**, **javascript**, **python**, **ruby**, **rust**, **zig**.

See [**templates/README.md**](./templates/README.md) for status, ownership detail, and copy destinations.


## Shell Scripts


### run_all_unit_tests.sh

See [**shell-scripts/run_all_unit_tests/README.md**](./shell-scripts/run_all_unit_tests/README.md) for copy commands, the full flag matrix, layout contracts, and environment variables.

Language variants:

* [**JavaScript**](./shell-scripts/run_all_unit_tests/javascript/run_all_unit_tests.sh) — `npm` / `pnpm` / `yarn` **`test`**;
* [**Python**](./shell-scripts/run_all_unit_tests/python/run_all_unit_tests.sh) — `unittest` discovery under **tests/** (prefers **`.venv`** when present);
* [**Ruby**](./shell-scripts/run_all_unit_tests/ruby/run_all_unit_tests.sh) — Test::Unit suite **test/unit/ts_all.rb** (or per-file `tc_*.rb` with `--separate`);

Use `--help` on any variant for the authoritative flag list.


## Project drop-in templates

See [**templates/README.md**](./templates/README.md). Families:

* [**.editorconfig**](./templates/editorconfig/README.md);
* [**.gitattributes**](./templates/gitattributes/README.md);
* [**.gitignore**](./templates/gitignore/README.md);
* [**.vimrc**](./templates/vimrc/README.md);
* [**.vscode/**](./templates/vscode/README.md);

**Phase 2:** all families populated for every language key — ready to copy. **misc-config-scripts** **0.8.2+** no longer ships legacy catalogs.


## Related projects

A peer project that provides **`.commonrc`** and **`.gitconfig`** is [**misc-config-scripts**](https://github.com/synesissoftware/misc-config-scripts) (**0.8.2+**).

Resources from this project are used in the following projects (case-insensitive lexicographic order):

* [**asynkio**](https://github.com/synesissoftware/asynkio) (**Python**);
* [**CLASP.Python**](https://github.com/synesissoftware/CLASP.Python);
* [**CLASP.Ruby**](https://github.com/synesissoftware/CLASP.Ruby);
* [**cmpfs.Ruby**](https://github.com/synesissoftware/cmpfs.Ruby);
* [**comment_strip.r**](https://github.com/synesissoftware/comment_strip.r);
* [**Diagnosticism.Python**](https://github.com/synesissoftware/Diagnosticism.Python);
* [**Diagnosticism.Ruby**](https://github.com/synesissoftware/Diagnosticism.Ruby);
* [**libCLImate.Ruby**](https://github.com/synesissoftware/libCLImate.Ruby);
* [**libpath.Python**](https://github.com/synesissoftware/libpath.Python);
* [**libpath.Ruby**](https://github.com/synesissoftware/libpath.Ruby);
* [**Pantheios.Ruby**](https://github.com/synesissoftware/Pantheios.Ruby);
* [**py2be**](https://github.com/synesissoftware/py2be) (**Python**);
* [**recls.Ruby**](https://github.com/synesissoftware/recls.Ruby);
* [**SyLVReD.Ruby**](https://github.com/synesissoftware/SyLVReD.Ruby);
* [**to_be.Ruby**](https://github.com/synesissoftware/to_be.Ruby);
* [**xqsr3**](https://github.com/synesissoftware/xqsr3) (**Ruby**);


## Project Information

* **VERSION** — see [**VERSION**](./VERSION);
* **CHANGES** — see [**CHANGES.md**](./CHANGES.md);
* **NEWS** — see [**NEWS.md**](./NEWS.md);
* **TODO** — see [**TODO.md**](./TODO.md);
* **License** — BSD-3-Clause; see [**LICENSE**](./LICENSE);


<!-- ########################### end of file ########################### -->
