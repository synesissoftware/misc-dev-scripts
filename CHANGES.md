# misc-dev-scripts - CHANGES <!-- omit in toc -->


## Table of Contents <!-- omit in toc -->

- [0.1.1](#011)


## 0.1.1 - 11th August 2026

* Added **.github/workflows/ci.yml** (`bash -n` on all `*.sh`; `--help` smoke for Python and Ruby variants);
* Added **CHANGES.md**, **NEWS.md**, **TODO.md**, and **VERSION**;
* Moved canonical helpers from **bash/run_all_unit_tests.sh/** to **shell-scripts/run_all_unit_tests/**;
* Replaced root **.gitattributes** (dropped orphan `*.commonrc` rule; shell / docs / Linguist baseline aligned with **misc-config-scripts**);
* Replaced **.vscode/settings.json** with **misc-config-scripts** `settings.json/generic/settings.json` (multi-language union template; matches sibling guidance for mixed trees);
* Improved **README.md**:
  * badges (Language, License, Last Commit, CI);
  * short introduction and adoption note;
  * Python / Ruby flag matrix and layout contracts for **run_all_unit_tests.sh**;
  * lexicographic related-projects list;
  * link to sibling project **misc-config-scripts**;
* Established baseline documentation for the existing shell helpers:
  * **shell-scripts/run_all_unit_tests/python/run_all_unit_tests.sh**;
  * **shell-scripts/run_all_unit_tests/ruby/run_all_unit_tests.sh**;


<!-- ########################### end of file ########################### -->
