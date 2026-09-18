# Project drop-in templates <!-- omit in toc -->


Language-specific **project** drop-in templates for Synesis (and related) libraries.

This tree is the **canonical catalogue** for project-local config files that consumers copy into a repository root (or **`.vscode/`**).


## Table of Contents <!-- omit in toc -->

- [Status](#status)
- [Self boilerplate vs templates](#self-boilerplate-vs-templates)
- [Ownership](#ownership)
- [Layout](#layout)
- [Language keys](#language-keys)
- [How to use](#how-to-use)
- [Related](#related)


## Status

**Phase 3 complete:** all five families × eleven language keys hold copyable templates. This tree is the sole canonical home (legacy **misc-config-scripts** `settings.json/` and `gitattributes/` catalogs removed in that repo’s **0.8.2**).


## Self boilerplate vs templates

| Kind | Where | Purpose |
| --- | --- | --- |
| **Self** | Repository root (e.g. this project's own **`.vimrc`**, **`.gitignore`**) | Configures *this* repository |
| **Template** | Under **`templates/<family>/<lang>/`** | Copied into *other* projects |

Do not confuse root self files with the catalogue under **`templates/`**.


## Ownership

| Template family | Canonical home | Notes |
| --- | --- | --- |
| **editorconfig** | **misc-dev-scripts** `templates/editorconfig/` | Seeded from freelibs exemplars + house indent rules |
| **gitattributes** | **misc-dev-scripts** `templates/gitattributes/` | Migrated from **misc-config-scripts** `gitattributes/` |
| **gitignore** | **misc-dev-scripts** `templates/gitignore/` | Lean Synesis-header consensus per language |
| **vimrc** | **misc-dev-scripts** `templates/vimrc/` | Freelibs language gold (+ synthesized JS / generic) |
| **vscode** (`settings.json`) | **misc-dev-scripts** `templates/vscode/` | Migrated from **misc-config-scripts** `settings.json/` |
| **run_all_unit_tests.sh** | **misc-dev-scripts** `shell-scripts/run_all_unit_tests/` | Already canonical |
| **.gitconfig** / **.commonrc** | **misc-config-scripts** only | Machine / shell environment — not project drop-ins |


## Layout

| Path | Consumer destination |
| --- | --- |
| **editorconfig/\<lang\>/.editorconfig** | **`.editorconfig`** |
| **gitattributes/\<lang\>/.gitattributes** | **`.gitattributes`** |
| **gitignore/\<lang\>/.gitignore** | **`.gitignore`** |
| **vimrc/\<lang\>/.vimrc** | **`.vimrc`** |
| **vscode/\<lang\>/settings.json** | **`.vscode/settings.json`** |

Shell helpers remain under **`shell-scripts/`** (not under **`templates/`**).


## Language keys

Lexicographic language directory names (same set for every family):

* **c**;
* **c#**;
* **c_cxx** (mixed C / C++);
* **cxx**;
* **generic** (union / mixed-language trees);
* **go**;
* **javascript**;
* **python**;
* **ruby**;
* **rust**;
* **zig**.


## How to use

```sh
cp templates/vscode/python/settings.json /path/to/repo/.vscode/settings.json
```

```sh
cp templates/gitattributes/go/.gitattributes /path/to/repo/.gitattributes
```

When updating a consumer, cite this repository’s **VERSION** in that project’s **CHANGES.md**.


## Related

* [**shell-scripts/run_all_unit_tests/README.md**](../shell-scripts/run_all_unit_tests/README.md) — test-runner helpers;
* Sibling [**misc-config-scripts**](https://github.com/synesissoftware/misc-config-scripts) — **`.gitconfig`** and **`.commonrc`** only (**0.8.2+**);


<!-- ########################### end of file ########################### -->
