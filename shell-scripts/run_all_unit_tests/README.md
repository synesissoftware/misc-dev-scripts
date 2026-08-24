# `run_all_unit_tests` scripts <!-- omit in toc -->


Drop-in **run_all_unit_tests.sh** helpers for Synesis (and related) language libraries, organised by primary language.

Canonical copies live in this directory; consuming projects keep a _root-level_ **run_all_unit_tests.sh** (or **run_all_unit_tests.cmd**), which you should copy; do not symlink unless you deliberately want coupling.


## Table of Contents <!-- omit in toc -->

- [How to use](#how-to-use)
- [Language variants](#language-variants)
- [Flags](#flags)
- [Layout contracts](#layout-contracts)
- [Environment variables](#environment-variables)
- [Layout](#layout)
- [What is intentionally omitted](#what-is-intentionally-omitted)


## How to use

Copy the language variant that matches the consumer project into the project root as **run_all_unit_tests.sh**:

```sh
cp shell-scripts/run_all_unit_tests/python/run_all_unit_tests.sh /path/to/repo/run_all_unit_tests.sh
```

```sh
cp shell-scripts/run_all_unit_tests/ruby/run_all_unit_tests.sh /path/to/repo/run_all_unit_tests.sh
```

When updating a consumer, cite this repository’s **VERSION** in that project’s **CHANGES.md**.

Use `--help` on the installed script for the authoritative flag list.


## Language variants

| Language | Path | Status |
| --- | --- | --- |
| **Python** | [**python/run_all_unit_tests.sh**](./python/run_all_unit_tests.sh) | ✅ shipped |
| **Ruby** | [**ruby/run_all_unit_tests.sh**](./ruby/run_all_unit_tests.sh) | ✅ shipped |
| **C / C++** | **c_cxx/** | ⚠️ directory reserved |
| **Go** | **go/** | ⚠️ directory reserved |
| **Zig** | **zig/** | ⚠️ directory reserved |


## Flags

| Flag / behaviour | Python | Ruby |
| --- | --- | --- |
| `--help` | ✅ | ✅ |
| Explicit interpreter | `--python-cmd-path` / `-p` | uses `ruby` / **rbenv** |
| Python 2 discovery | `--assume-python2`; `--include-python2-in-search` (otherwise only-`python2` is an error) | — |
| `--pwd` (run relative to CWD) | ❌ | ✅ |
| `--debug` | ❌ | ✅ |
| `--warnings` / `--warn` | ❌ | ✅ |
| `--separate` (one process per test file/module) | ❌ | ✅ |
| Multi-version matrix | ❌ | `--rbenv-versions` (+ optional **.ruby-version-exclusions**) |


## Layout contracts

* **Python**: the script’s directory is treated as the project root; tests live under **tests/** and are discovered with `python -m unittest discover -s <tests-dir>` (subdirectories participate when they contain `__init__.py`);
* **Ruby**: default suite is **test/unit/ts_all.rb**; with `--separate`, every **tc_*.rb** under the project tree is executed individually; `--pwd` uses the present working directory as the project root instead of the script directory; `--rbenv-versions` requires an available **rbenv** (**.ruby-version** is optional; **.ruby-version-exclusions** remains optional);


## Environment variables

**Python** (used when `--python-cmd-path` / `-p` is not given), in order:

1. **`--assume-python2`** — if set, use `python2` (must be on `PATH` / executable);
2. **`PYTHON_COMMAND_PATH`** — if set and executable, used as the interpreter;
3. **`PYTHON_CMD_PATH`** — same, if the previous is unset or not executable;
4. otherwise probe `python3`, then `python` on `PATH`; with **`--include-python2-in-search`**, also probe `python2`;
5. if neither Python 2 flag is set and only `python2` is present on `PATH`, the script exits with an error suggesting **`--include-python2-in-search`** or **`--assume-python2`**;

**Ruby**: `--rbenv-versions` drives each child with **`RBENV_VERSION`** across `rbenv versions --bare`; optional **.ruby-version-exclusions** skips listed versions; optional **.ruby-version** is reported as “current” in the status line only (not required); colours use `tput` only when **`$TERM`** is set and stdout is a TTY (override with **`FG_BLUE`**, **`FG_RED`**, **`FD_BOLD`**, **`FD_NONE`**).


## Layout

| Path | Role |
| --- | --- |
| **c_cxx/** | Reserved for a future C/C++ helper |
| **go/** | Reserved for a future Go helper |
| **python/run_all_unit_tests.sh** | Python unit-test runner |
| **ruby/run_all_unit_tests.sh** | Ruby unit-test runner |
| **zig/** | Reserved for a future Zig helper |


## What is intentionally omitted

* Windows **.cmd** counterparts (tracked in top-level **TODO.md**);
* JavaScript / Rust runners (not yet present under this tree);
* Package-manager install paths (copy remains the adoption model);


<!-- ########################### end of file ########################### -->
