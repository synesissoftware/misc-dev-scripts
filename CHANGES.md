# misc-dev-scripts - CHANGES <!-- omit in toc -->


## Table of Contents <!-- omit in toc -->

- [0.4.2 - 19th August 2026](#042---19th-august-2026)
- [0.4.1 - 17th August 2026](#041---17th-august-2026)
- [0.4.0 - 16th August 2026](#040---16th-august-2026)
- [0.3.0 - 15th August 2026](#030---15th-august-2026)
- [0.2.0 - 12th August 2026](#020---12th-august-2026)
- [0.1.1 - 11th August 2026](#011---11th-august-2026)


## 0.4.2 - 19th August 2026

* **shell-scripts/run_all_unit_tests/ruby/run_all_unit_tests.sh**:
  * skip `tput` when `$TERM` is unset or stdout is not a TTY (CI: `tput: No value for $TERM and no -T specified`);
  * still honour **`FG_BLUE`**, **`FG_RED`**, **`FD_BOLD`**, **`FD_NONE`** when set;
* **.github/workflows/ci.yml**: Ruby `--help` smoke runs with `TERM` unset and fails if `tput` writes to stderr;


## 0.4.1 - 17th August 2026

* **shell-scripts/run_all_unit_tests/ruby/run_all_unit_tests.sh**:
  * improved `--rbenv-versions` discovery by reporting `rbenv` failures and avoiding an empty version entry when no versions are returned;
  * corrected indentation in the version-discovery loop;
  * propagate failures from test-file discovery in `--separate` mode;


## 0.4.0 - 16th August 2026

* **shell-scripts/run_all_unit_tests/python/run_all_unit_tests.sh**:
  * aligned `--help` with implemented flags (`--python-cmd-path` / `-p`; dropped undocumented `--python`);
  * added `--assume-python2` and `--include-python2-in-search`; default discovery is `python3` then `python` (no `python2`);
  * if neither Python 2 flag is set and only `python2` is on `PATH`, exit with an error suggesting those flags;
  * invoke discovery as `python -m unittest discover -s <tests-dir>`;
  * prefer `command -v` over `which`; quoted `basename` expansion;
  * corrected diagnostic (“found valid python command”);
* Updated **shell-scripts/run_all_unit_tests/README.md** (Python 2 flags; `unittest discover -s`; interpreter discovery order);


## 0.3.0 - 15th August 2026

* **shell-scripts/run_all_unit_tests/ruby/run_all_unit_tests.sh**:
  * `--rbenv-versions` selects each interpreter via `RBENV_VERSION` (no longer writes `rbenv local` / `.ruby-version`);
  * `--rbenv-versions` no longer requires a **.ruby-version** file (still optional for status display; **.ruby-version-exclusions** remains optional);
  * rebuilt forwarded argv as an array for `--rbenv-versions` recursion (quoted `"$0" "${ForwardArgs[@]}"`);
  * ignore `--rbenv-versions` in the regular flag pass (so `--help --rbenv-versions` is not treated as an unrecognised argument);
  * `--separate` aggregates per-file `ruby` failures into a non-zero script exit (no longer relies on `find -exec` status);
  * corrected red colour initialisation (`SisClr_*` + `FG_RED`; was `FG_BLUE`);
  * quoted `basename` expansion;
* Updated **shell-scripts/run_all_unit_tests/README.md** (Ruby `--rbenv-versions` contract: **rbenv** required; **.ruby-version** optional; **`RBENV_VERSION`** documented);


## 0.2.0 - 12th August 2026

* Added `--lib` to **shell-scripts/run_all_unit_tests/ruby/run_all_unit_tests.sh** (prepends the project's **lib** directory into **RUBYLIB** before executing tests);


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


<!-- ########################### end of file ########################### -->
