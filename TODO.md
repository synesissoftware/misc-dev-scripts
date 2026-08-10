# misc-dev-scripts - TODO <!-- omit in toc -->


## Table of Contents <!-- omit in toc -->

- [Correctness / defects](#correctness--defects)
  - [**Python** **run\_all\_unit\_tests.sh**:](#python-run_all_unit_testssh)
  - [**Ruby** **run\_all\_unit\_tests.sh**:](#ruby-run_all_unit_testssh)
- [Functional improvements](#functional-improvements)
  - [Python / Ruby parity](#python--ruby-parity)
  - [Modern Python / Ruby runners](#modern-python--ruby-runners)
  - [Language expansion](#language-expansion)
  - [Windows counterparts](#windows-counterparts)
- [Performance improvements](#performance-improvements)
- [Packaging / CI / docs](#packaging--ci--docs)


## Correctness / defects


### **Python** **run_all_unit_tests.sh**:

* [ ] align `--help` with implemented flags (documents `--python`, implements `--python-cmd-path` / `-p`);
* [ ] fix diagnostic typo (“found validation python command” → “valid”);
* [ ] invoke discovery as `python -m unittest discover -s <tests-dir> …`;
* [ ] Prefer `command -v` over `which`; quote `basename` expansions in both scripts;
* [ ] Drop `python2` from default Python command discovery (or gate behind an explicit opt-in);


### **Ruby** **run_all_unit_tests.sh**:

* [ ] fix `RbEnvClr_Red` initialisation (currently uses `FG_BLUE` / wrong colour);
* [ ] rebuild argv with an array under `--rbenv-versions` (string concatenation breaks spaced arguments);
* [ ] avoid mutating `rbenv local` for the version matrix (prefer `RBENV_VERSION` / `rbenv exec`, restore on exit/INT);
* [ ] `--separate` must aggregate non-zero exits from per-file runs;


## Functional improvements

### Python / Ruby parity

* [ ] **Python**: add `--pwd` (match **Ruby**);
* [ ] **Python**: warnings / verbosity knobs (`PYTHONWARNINGS`, optional verbose unittest output);
* [ ] **Python**: `--separate` (one process per test module);
* [ ] **Python**: multi-version matrix (`--pyenv-versions` + exclusions file, or document **tox** / **nox** as preferred and wrap thinly);
* [ ] **Ruby**: optional `--suite` / `--pattern` overrides (keep `test/unit/ts_all.rb` and `tc_*.rb` defaults);
* [ ] **Ruby**: optional `bundle exec`;
* [x] Document environment variables (`PYTHON_CMD_PATH`, `PYTHON_COMMAND_PATH`, …) in the nested script README;

### Modern Python / Ruby runners

* [ ] **Python**: optional `--pytest` and/or auto-detect pytest configuration;
* [ ] **Python**: optional `--uv` → `uv run …`;
* [ ] **Python**: support both `unittest discover` and `tests/run_unittest.py` entrypoints (flag or auto-detect);
* [ ] **Ruby**: keep Test::Unit / `ts_all.rb` as default; defer RSpec or document as out of scope;

### Language expansion

* [ ] Add **Go** **run_all_unit_tests.sh** (lift freelibs Go pattern: `.sis/project_name.txt`, `go list` packages with tests, `--list-only`, verbosity);
* [ ] Add **JavaScript** **run_all_unit_tests.sh** (thin `npm test` / detect `pnpm` / `yarn`, plus `--help` / `--pwd`);
* [ ] Add **Rust** **run_all_unit_tests.sh** (`cargo test`, optional `--workspace` / `--all-features`);
* [ ] Add **Zig** **run_all_unit_tests.sh** (`zig build test`);
* [ ] Extract shared Bash preamble only once a third language lands;

### Windows counterparts

* [ ] Create **.cmd** counterparts of the **run_all_unit_tests** scripts (per language under **shell-scripts/run_all_unit_tests/**), matching the shell flags and layout contracts where feasible;


## Performance improvements

* \<none>


## Packaging / CI / docs

* [x] Add **VERSION**;
* [x] Add **CHANGES.md**;
* [x] Add **TODO.md**;
* [x] Upgrade **README.md** (badges, flag matrix, layout contracts, related projects, sibling link);
* [x] Fill **.github/workflows/ci.yml**: `bash -n` on all `*.sh`; `--help` smoke for each language variant;
* [x] Fix root **.gitattributes** (drop orphan `*.commonrc` rule; align with **misc-config-scripts** shell / generic patterns);
* [x] Replace **.vscode/settings.json** with **misc-config-scripts** `settings.json/generic/settings.json` (multi-language union; not a hand-slimmed subset);
* [x] Align **LICENSE** year range with current year;
* [x] Add nested **shell-scripts/run_all_unit_tests/README.md** (copy command, per-lang paths, layout contracts, flag table);
* [ ] Optional: sample bootstrap notes for copy-vs-sync adoption;
* [ ] Distribution / drift control: `SCRIPT_VERSION` header matching **VERSION**; document consumer CHANGES citation convention; optional sync helper; optional `testdata/` CI fixtures;


<!-- ########################### end of file ########################### -->
