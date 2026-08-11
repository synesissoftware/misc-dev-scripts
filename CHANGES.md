# misc-dev-scripts - CHANGES <!-- omit in toc -->


## Table of Contents <!-- omit in toc -->

- [0.1.1](#011)


## 0.1.1 - 11th August 2026

* Added **.github/workflows/ci.yml** (`bash -n` on all `*.sh`; `--help` smoke for Python and Ruby variants);
* Added **CHANGES.md**, **NEWS.md**, **TODO.md**, and **VERSION**;
* Moved canonical helpers from **bash/run_all_unit_tests.sh/** to **shell-scripts/run_all_unit_tests/**;
* Replaced root **.gitattributes** (dropped orphan `*.commonrc` rule; shell / docs / Linguist baseline aligned with **misc-config-scripts**);
* Replaced **.vscode/settings.json** with **misc-config-scripts** `settings.json/generic/settings.json` (multi-language union template; matches sibling guidance for mixed trees);
* Added **shell-scripts/run_all_unit_tests/README.md** (copy commands, language layout, flag matrix, contracts, environment variables);
* Improved **README.md**:
  * badges (Language, License, Last Commit, CI);
  * short introduction and adoption note;
  * link to nested **run_all_unit_tests** README for flag matrix and layout contracts;
  * lexicographic related-projects list;
  * link to sibling project **misc-config-scripts**;
* Established baseline documentation for the existing shell helpers:
  * **shell-scripts/run_all_unit_tests/python/run_all_unit_tests.sh**;
  * **shell-scripts/run_all_unit_tests/ruby/run_all_unit_tests.sh**;
* **shell-scripts/run_all_unit_tests/ruby/run_all_unit_tests.sh**:
  * `--rbenv-versions` selects each interpreter via `RBENV_VERSION` (no longer writes `rbenv local` / `.ruby-version`);
  * `--rbenv-versions` no longer requires a **.ruby-version** file (still optional for status display; **.ruby-version-exclusions** remains optional);
  * rebuilt forwarded argv as an array for `--rbenv-versions` recursion (quoted `"$0" "${ForwardArgs[@]}"`);
  * ignore `--rbenv-versions` in the regular flag pass when combined with `--help`;
  * `--separate` aggregates per-file `ruby` failures into a non-zero script exit (no longer relies on `find -exec` status);
* **shell-scripts/run_all_unit_tests/python/run_all_unit_tests.sh**:
  * aligned `--help` USAGE with implemented `--python-cmd-path` / `-p` flags;
  * fixed diagnostic typo (“found valid python command”);
  * prefer `command -v` over `which`; quote `basename`; validate explicit paths with `[ -x ]` or `command -v`;
  * invoke unit-tests via `python -m unittest discover -s <tests-dir>`;


<!-- ########################### end of file ########################### -->
