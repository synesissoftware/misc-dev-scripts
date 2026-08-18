#! /bin/bash

# ######################################################################## #
# File:     run_all_unit_tests.sh
#
# Purpose:  Executes the unit-tests of a Ruby project regardless of
#           calling directory, allowing use of debug mode, warnings, and
#           executing each rbenv version
#
# Created:  9th June 2011
# Updated:  19th August 2026
#
# Copyright (c) Matthew Wilson, 2011-2026
# All rights reserved
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
#
# * Neither the names of the copyright holder nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# ######################################################################## #


# constants

Source="${BASH_SOURCE[0]}"
while [ -h "$Source" ]; do

  ScriptDir="$(cd -P "$(dirname "$Source")" && pwd)"
  Source="$(readlink "$Source")"
  [[ $Source != /* ]] && Source="$ScriptDir/$Source"
done
ScriptDir="$(cd -P "$( dirname "$Source" )" && pwd)"
Basename="$(basename "$Source")"


# colours

SisClr_Blue=${FG_BLUE:-}
SisClr_Red=${FG_RED:-}
SisClr_Bold=${FD_BOLD:-}
SisClr_None=${FD_NONE:-}

if [ -n "${TERM:-}" ] && [ -t 1 ] && command -v tput >/dev/null 2>&1; then

  if tput sgr0 >/dev/null 2>&1; then

    SisClr_Blue=${FG_BLUE:-$(tput setaf 4)}
    SisClr_Red=${FG_RED:-$(tput setaf 1)}
    SisClr_Bold=${FD_BOLD:-$(tput bold)}
    SisClr_None=${FD_NONE:-$(tput sgr0)}
  fi
fi


# special command-line handling ('--pwd', '--rbenv-versions')

ProjectDir="$ScriptDir"
ForwardArgs=()
FoundHelp=
RunRbEnvAllVersions=

for arg in "$@"
do

  case "$arg" in

  --help)

    FoundHelp=1
    ForwardArgs+=("$arg")
    ;;
  --pwd)

    ProjectDir=$(pwd)
    ForwardArgs+=("$arg")
    ;;
  --rbenv-versions)

    RunRbEnvAllVersions=1
    ;;
  *)

    ForwardArgs+=("$arg")
    ;;
  esac
done

if [ ! -z "$FoundHelp" ]; then

  RunRbEnvAllVersions=
fi

if [ ! -z "$RunRbEnvAllVersions" ]; then

  if ! command -v rbenv > /dev/null; then

    >&2 echo "$0: ${SisClr_Red}${SisClr_Bold}rbenv${SisClr_None} not detected"

    exit 1
  fi

  exclusions=()
  if [ -e "$ProjectDir/.ruby-version-exclusions" ]; then

    exclusion_lines=`cat "$ProjectDir/.ruby-version-exclusions"`
    for line in $exclusion_lines; do

      exclusions+=("$line")
    done
  fi

  echo "executing command line '${SisClr_Blue}${SisClr_Bold}$0 ${ForwardArgs[*]}${SisClr_None}' with all Ruby versions ..."

  current=
  if [ -f "$ProjectDir/.ruby-version" ]; then

    current=$(tr -d '[:space:]' < "$ProjectDir/.ruby-version")
  fi

  if ! version_output=$(rbenv versions --bare); then

    >&2 echo "$0: ${SisClr_Red}${SisClr_Bold}failed to enumerate Ruby versions via rbenv${SisClr_None}"
    exit 1
  fi

  versions=()
  if [ -n "$version_output" ]; then

    while IFS= read -r line; do

      versions+=("$line")
    done <<< "$version_output"
  fi

  echo "versions: ${SisClr_Blue}${SisClr_Bold}${versions[*]}${SisClr_None}; skipped versions: ${SisClr_Blue}${SisClr_Bold}${exclusions[*]}${SisClr_None}; current version: ${SisClr_Blue}${SisClr_Bold}${current:-(none)}${SisClr_None}"

  result=0

  for version in "${versions[@]}"
  do

    echo

    skip=

    for exclusion in "${exclusions[@]}"; do

      if [[ "$exclusion" == "$version" ]]; then

        skip=1
      fi
    done

    if [ "$skip" != "" ]; then

      echo "skipping Ruby version ${SisClr_Blue}${SisClr_Bold}$version${SisClr_None}:"
    else

      echo "processing Ruby version ${SisClr_Blue}${SisClr_Bold}$version${SisClr_None}:"

      echo -e "\texecuting command line 'RBENV_VERSION=$version $0 ${ForwardArgs[*]}' with Ruby version $version ..."

      if ! RBENV_VERSION="$version" "$0" "${ForwardArgs[@]}"; then

        result=1
      fi
    fi
  done

  exit $result
fi


# regular command-line handling

Separate=
DebugFlag=
PrependLib=
WarningsFlag=-W0

for v in "$@"
do

  case "$v" in

    --debug)

      DebugFlag=--debug
      ;;
    --help)

      cat << EOF
USAGE: $Basename { | --help | [ --debug ] [ --lib ] [ --pwd ] [ --rbenv-versions ] [ --separate ] [ --warnings ]}

flags:

  --help
  shows this help and terminates

  --debug
  executes Ruby interpreter in debug mode

  --lib
  prepends the lib directory under the script's directory into RUBYLIB before executing

  --pwd
  executes from present working directory, rather than relative to the script directory

  --rbenv-versions
  executes this script (with all other specified arguments) for each rbenv version (except those listed in the file .ruby-version-exclusions, if present)

  --separate
  executes each unit-test in a separate program

  --warnings
  executes Ruby interpreter in warnings mode
EOF

      exit 0
      ;;
    --lib)

      PrependLib=1
      ;;
    --pwd)

      # already-processed as special case above
      ;;
    --rbenv-versions)

      # already-processed as special case above
      ;;
    --separate)

      Separate=true
      ;;
    --warnings|--warn)

      WarningsFlag=-W2 #-W:performance
      ;;
    *)

      >&2 echo "unrecognised argument '$v'; use --help for usage"

      exit 1
      ;;
  esac
done


# executing tests

if [ ! -z "$PrependLib" ]; then

  export RUBYLIB=$ProjectDir/lib:$RUBYLIB
fi


if [ -z "$Separate" ]; then

  ruby $DebugFlag $WarningsFlag "$ProjectDir/test/unit/ts_all.rb"
else

  result=0

  test_files=$(mktemp "${TMPDIR:-/tmp}/run_all_unit_tests.XXXXXX") || {
    >&2 echo "$0: ${SisClr_Red}${SisClr_Bold}failed to create temporary file for test discovery${SisClr_None}"
    exit 1
  }
  trap 'rm -f "$test_files"' EXIT

  if ! find "$ProjectDir" -name 'tc_*.rb' -print0 > "$test_files"; then
    >&2 echo "$0: ${SisClr_Red}${SisClr_Bold}failed to discover test files${SisClr_None}"
    exit 1
  fi

  while IFS= read -r -d '' testfile; do

    if ! ruby $DebugFlag $WarningsFlag "$testfile"; then

      result=1
    fi
  done < "$test_files"

  exit $result
fi


# ############################## end of file ############################# #

