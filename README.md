# misc-dev-scripts <!-- omit in toc -->

Miscellaneous Development Scripts

![Language](https://img.shields.io/badge/language-Bash-blue.svg)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Last Commit](https://img.shields.io/github/last-commit/synesissoftware/misc-dev-scripts)](https://github.com/synesissoftware/misc-dev-scripts/commits/master)
[![CI](https://github.com/synesissoftware/misc-dev-scripts/actions/workflows/ci.yml/badge.svg)](https://github.com/synesissoftware/misc-dev-scripts/actions/workflows/ci.yml)


## Table of Contents <!-- omit in toc -->

- [Introduction](#introduction)
- [Bash Scripts](#bash-scripts)
  - [run\_all\_unit\_tests.sh](#run_all_unit_testssh)
- [Related projects](#related-projects)
- [Project Information](#project-information)


## Introduction

**misc-dev-scripts** is a small catalog of Bash helpers intended to be **copied** into Synesis (and related) language libraries — principally **run_all_unit_tests.sh** variants for **Python** and **Ruby** today, with further languages planned.

Canonical copies live under **bash/**; consuming projects keep a root-level **run_all_unit_tests.sh**. When updating a consumer, cite this repository’s **VERSION** in that project’s **CHANGES.md**.

Sibling project: [**misc-config-scripts**](https://github.com/synesissoftware/misc-config-scripts) (shell rc, Git, and editor/attribute templates).


## Bash Scripts


### run_all_unit_tests.sh

Language variants:

* [**Python**](./bash/run_all_unit_tests.sh/python/run_all_unit_tests.sh) — `unittest` discovery under **tests/**;
* [**Ruby**](./bash/run_all_unit_tests.sh/ruby/run_all_unit_tests.sh) — Test::Unit suite **test/unit/ts_all.rb** (or per-file `tc_*.rb` with `--separate`);

Use `--help` on either variant for the authoritative flag list.

| Flag / behaviour | Python | Ruby |
| --- | --- | --- |
| `--help` | ✅ | ✅ |
| Explicit interpreter | `--python-cmd-path` / `-p` (also `PYTHON_CMD_PATH` / `PYTHON_COMMAND_PATH`) | uses `ruby` / **rbenv** |
| `--pwd` (run relative to CWD) | ❌ | ✅ |
| `--debug` | ❌ | ✅ |
| `--warnings` / `--warn` | ❌ | ✅ |
| `--separate` (one process per test file/module) | ❌ | ✅ |
| Multi-version matrix | ❌ | `--rbenv-versions` (+ optional **.ruby-version-exclusions**) |

#### Layout contracts

* **Python**: script directory is the project root; tests live under **tests/** and are discovered with `python -m unittest discover` (subdirectories participate when they contain `__init__.py`);
* **Ruby**: default suite is **test/unit/ts_all.rb**; with `--separate`, every **tc_*.rb** under the project tree is executed individually; `--rbenv-versions` requires **.ruby-version** and an available **rbenv**;


## Related projects

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
* **TODO** — see [**TODO.md**](./TODO.md);
* **License** — BSD-3-Clause; see [**LICENSE**](./LICENSE);


<!-- ########################### end of file ########################### -->
