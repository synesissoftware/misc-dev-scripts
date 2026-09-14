# misc-dev-scripts - Changes <!-- omit in toc -->


## Table of Contents <!-- omit in toc -->

- [0.6.0 - 15th September 2026](#060---15th-september-2026)
- [0.5.3 - 15th September 2026](#053---15th-september-2026)
- [0.5.2 - 15th September 2026](#052---15th-september-2026)
- [0.5.1 - 14th September 2026](#051---14th-september-2026)
- [0.5.0 - 1st September 2026](#050---1st-september-2026)
- [0.4.2 - 25th August 2026](#042---25th-august-2026)
- [0.4.1 - 17th August 2026](#041---17th-august-2026)
- [0.4.0 - 16th August 2026](#040---16th-august-2026)
- [0.3.0 - 15th August 2026](#030---15th-august-2026)
- [0.2.0 - 12th August 2026](#020---12th-august-2026)
- [0.1.1 - 11th August 2026](#011---11th-august-2026)


## 0.6.0 - 15th September 2026

* Phase 2: populate **templates/** as the canonical project drop-in catalogue:
  * **templates/vscode/** — migrated from **misc-config-scripts** `settings.json/` (plus **c_cxx** alias of **cxx**);
  * **templates/gitattributes/** — migrated from **misc-config-scripts** `gitattributes/`;
  * **templates/vimrc/** — freelibs language gold plus synthesized **javascript** / **generic**;
  * **templates/editorconfig/** — freelibs **python** / **ruby** plus synthesized house rules for other languages;
  * **templates/gitignore/** — lean Synesis-header consensus per language;
* **templates/vimrc/**: lexicographically ordered language sections and combined `[label]` / `FileType` lists (revisibility);
* Phase 4: align self boilerplate with **templates/** gold:
  * confirmed **`.vscode/settings.json`** byte-identical to **templates/vscode/generic/settings.json**;
  * refreshed **`.gitignore`** from **templates/gitignore/generic/**;
  * normalised self **`.gitattributes`** to shell / docs catalog form (templates remain under **templates/gitattributes/**);
  * retained shell / docs **`.editorconfig`** and **`.vimrc`** (not replaced by language-generic consumer templates);
* Updated **templates/** READMEs (status, copy commands, layout);
* Updated **README.md** (Phase 2–3 canonical; prefer **templates/** over legacy m-c-s catalogs);


## 0.5.3 - 15th September 2026

* Phase 1 self boilerplate:
  * added **`.editorconfig`** (shell / docs catalog: UTF-8, LF, shell 2-space, markdown/json/yaml);
  * replaced root **`.vimrc`** C/C++ consumer gold with shell / docs **self** **`.vimrc`** (aligned with **`.vscode/settings.json`**);
  * preserved former C/C++ gold as **templates/vimrc/c_cxx/.vimrc** for Phase 2;
  * confirmed **`.gitattributes`**, **`.gitignore`**, and **`.vscode/settings.json`** remain present as self files;
* Updated **templates/README.md** and **templates/vimrc/README.md** (c_cxx seed note);


## 0.5.2 - 15th September 2026

* Declared Phase 0 ownership with **misc-config-scripts**: this repo owns language-specific project drop-ins and **`run_all_unit_tests`**; sibling keeps **`.commonrc`** / **`.gitconfig`** only after cutover;
* Scaffolded **templates/** catalogue layout (`editorconfig`, `gitattributes`, `gitignore`, `vimrc`, `vscode` × language keys; **`.gitkeep`** placeholders);
* Added **templates/README.md** and per-family READMEs (status, copy destinations, migration notes);
* Updated **README.md** (ownership table; catalogue layout; templates section);


## 0.5.1 - 14th September 2026

* **shell-scripts/run_all_unit_tests/python/run_all_unit_tests.sh**:
  * prefer project-local **`.venv/bin/python`** when present (before **`PYTHON_COMMAND_PATH`** / PATH discovery; avoids Apple/Xcode `python3`);
  * load **`.sis/project_name.txt`** (fallback: directory basename) and optional **`.sis/script_info_lines.txt`** into `--help`;
* Updated **shell-scripts/run_all_unit_tests/README.md** (venv preference; `.sis` help contract);
* Updated **README.md** (JavaScript among shipped variants; Python prefers **`.venv`** when present);
* Updated **NEWS.md** to the three-column chronology (**Date** | **News Item** | **Details**);


## 0.5.0 - 1st September 2026

* **shell-scripts/run_all_unit_tests/javascript/run_all_unit_tests.sh**:
  * new JavaScript runner (`npm test` / `pnpm test` / `yarn test`; lockfile auto-detect; `--npm` / `--pnpm` / `--yarn`; `--help` / `--pwd` / `--no-install`; auto-install when **node_modules** is absent; skip `tput` when `$TERM` is unset or stdout is not a TTY);
* **.github/workflows/ci.yml**: JavaScript `--help` smoke runs with `TERM` unset and fails if `tput` writes to stderr;


## 0.4.2 - 25th August 2026

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
