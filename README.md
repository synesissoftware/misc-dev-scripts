# misc-dev-scripts <!-- omit in toc -->

Miscellaneous Development Scripts

![Language](https://img.shields.io/badge/language-Bash-blue.svg)
[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
[![Last Commit](https://img.shields.io/github/last-commit/synesissoftware/misc-dev-scripts)](https://github.com/synesissoftware/misc-dev-scripts/commits/master)
[![CI](https://github.com/synesissoftware/misc-dev-scripts/actions/workflows/ci.yml/badge.svg)](https://github.com/synesissoftware/misc-dev-scripts/actions/workflows/ci.yml)


## Table of Contents <!-- omit in toc -->

- [Introduction](#introduction)
- [Shell Scripts](#shell-scripts)
  - [run\_all\_unit\_tests.sh](#run_all_unit_testssh)
- [Related projects](#related-projects)
- [Project Information](#project-information)


## Introduction

**misc-dev-scripts** is a small catalog of shell helpers intended to be **copied** into Synesis (and related) language libraries — principally **run_all_unit_tests.sh** variants for **Python** and **Ruby** today, with further languages planned.

Canonical copies live under **shell-scripts/**; consuming projects keep a root-level **run_all_unit_tests.sh**. When updating a consumer, cite this repository’s **VERSION** in that project’s **CHANGES.md**.

Sibling project: [**misc-config-scripts**](https://github.com/synesissoftware/misc-config-scripts) (shell rc, Git, and editor/attribute templates).


## Shell Scripts


### run_all_unit_tests.sh

See [**shell-scripts/run_all_unit_tests/README.md**](./shell-scripts/run_all_unit_tests/README.md) for copy commands, the full flag matrix, layout contracts, and environment variables.

Language variants:

* [**Python**](./shell-scripts/run_all_unit_tests/python/run_all_unit_tests.sh) — `unittest` discovery under **tests/**;
* [**Ruby**](./shell-scripts/run_all_unit_tests/ruby/run_all_unit_tests.sh) — Test::Unit suite **test/unit/ts_all.rb** (or per-file `tc_*.rb` with `--separate`);

Use `--help` on either variant for the authoritative flag list.


## Related projects

A peer-project that provides configuration resources is [**misc-config-scripts**](https://github.com/synesissoftware/misc-config-scripts).

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
