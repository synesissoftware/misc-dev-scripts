# CMake helper scripts (C/C++) <!-- omit in toc -->

Updated: 9th October 2026

Gold Bash and native **`cmd.exe`** helpers for Synesis C/C++ libraries.
Dialect SSOT: **cstring** examining host on **`boilerplate`** (Phase 4b;
contract **freelibs** `.management/strategy/c-cpp/CXX-BOILERPLATE-PHASE4.md`).

Copy these files into each project root (byte-identical for common scripts).
Do **not** `source` this directory. Project-only `prepare_cmake.sh` flags live
in a marked **`# PROJECT-SPECIFIC FLAGS`** block inside that script.


## Contract highlights

* Bash: **`sis_cmake_build`**, **SisClr_*** colours, no **`MakeCmd`** /
  **`Makefile`** requirement; MinGW only via **`--mingw`** (or
  **`SIS_CMAKE_MINGW`**);
* Windows: native **`.cmd`** only — never `bash "%~dp0….sh"` wrappers;
* Automated = unit then component; scratch never discovers performance;
* Examples and scratch runners honour an optional allowed-to-fail list —
  **`.github/ci_examples_allowed_to_fail.txt`** /
  **`.github/ci_scratch_tests_allowed_to_fail.txt`** (one program name or
  stem per line; `#` comments): a listed program is still executed, but a
  non-zero exit is reported as anticipated and neither stops the run nor
  affects the exit status. Trees without the file are unaffected. Intended
  for unit-testing libraries whose demonstrations fail by design;


## Corpus

| Script | Notes |
| --- | --- |
| **`prepare_cmake.sh`** | May grow project-specific flags; keep common body aligned |
| **`build_cmake.sh`** | **`cmake --build`** only |
| **`clean_cmake.sh`** | **`cmake --build --target clean`** |
| **`ctest_cmake.sh`** | CTest after optional build |
| **`remove_cmake_artefacts.sh`** | Wipe known artefacts under **`SIS_CMAKE_BUILD_DIR`** |
| **`run_all_automated_tests.sh`** | Unit then component |
| **`run_all_component_tests.sh`** | Component only; empty → exit 0 |
| **`run_all_examples.sh`** | Examples only; empty → exit 0 |
| **`run_all_performance_tests.sh`** | Performance only; empty → exit 0 |
| **`run_all_scratch_tests.sh`** | Scratch + **`versions*`**; never performance |
| **`run_all_unit_tests.sh`** | Unit only; empty → exit 0 |
| **`run_all_automated_tests.cmd`** | Native **`cmd.exe`**; unit then component |
| **`run_all_component_tests.cmd`** | Native **`cmd.exe`**; component only |
| **`run_all_examples.cmd`** | Native **`cmd.exe`** |
| **`run_all_performance_tests.cmd`** | Native **`cmd.exe`** |
| **`run_all_scratch_tests.cmd`** | Native **`cmd.exe`**; never performance |
| **`run_all_unit_tests.cmd`** | Native **`cmd.exe`**; unit only |


<!-- ########################### end of file ########################### -->
