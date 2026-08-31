#! /bin/bash

# ######################################################################## #
# File:     run_all_unit_tests.sh
#
# Purpose:  Executes the unit-tests of a JavaScript project regardless of
#           calling directory
#
# Created:  25th August 2026
# Updated:  25th August 2026
#
# Copyright (c) Matthew Wilson, 2026
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


# special command-line handling ('--pwd')

ProjectDir="$ScriptDir"

for arg in "$@"
do

  case "$arg" in

  --pwd)

    ProjectDir=$(pwd)
    ;;
  esac
done


# regular command-line handling

PackageManager=
SkipInstall=

for v in "$@"
do

  case "$v" in

  --help)

    cat << EOF
USAGE: $Basename { | --help | [ --no-install ] [ --npm | --pnpm | --yarn ] [ --pwd ] }

flags:

  --help
  shows this help and terminates

  --no-install
  skips installing dependencies when node_modules is absent (default: run npm ci / install, or pnpm / yarn equivalent)

  --npm
  uses npm test (default when no other lockfile implies otherwise)

  --pnpm
  uses pnpm test

  --yarn
  uses yarn test

  --pwd
  executes from present working directory, rather than relative to the script directory
EOF

    exit 0
    ;;
  --no-install)

    SkipInstall=1
    ;;
  --npm)

    PackageManager=npm
    ;;
  --pnpm)

    PackageManager=pnpm
    ;;
  --yarn)

    PackageManager=yarn
    ;;
  --pwd)

    # already-processed as special case above
    ;;
  --no-install)

    ;;
  *)

    >&2 echo "$0: ${SisClr_Red}${SisClr_Bold}unrecognised argument${SisClr_None} '$v'; use --help for usage"

    exit 1
    ;;
  esac
done


# resolve package manager

if [ -z "$PackageManager" ]; then

  if [ -f "$ProjectDir/pnpm-lock.yaml" ]; then

    PackageManager=pnpm
  elif [ -f "$ProjectDir/yarn.lock" ]; then

    PackageManager=yarn
  else

    PackageManager=npm
  fi
fi

if ! command -v "$PackageManager" > /dev/null 2>&1; then

  >&2 echo "$0: ${SisClr_Red}${SisClr_Bold}$PackageManager${SisClr_None} not detected"

  exit 1
fi

if [ ! -f "$ProjectDir/package.json" ]; then

  >&2 echo "$0: ${SisClr_Red}${SisClr_Bold}package.json${SisClr_None} not found in '$ProjectDir'"

  exit 1
fi


# install dependencies (when node_modules is absent)

cd "$ProjectDir" || exit 1

if [ -z "$SkipInstall" ] && [ ! -d "$ProjectDir/node_modules" ]; then

  echo "installing dependencies via ${SisClr_Blue}${SisClr_Bold}$PackageManager${SisClr_None} ..."

  case "$PackageManager" in

  npm)

    if [ -f "$ProjectDir/package-lock.json" ]; then

      npm ci
    else

      npm install
    fi
    ;;
  pnpm)

    if [ -f "$ProjectDir/pnpm-lock.yaml" ]; then

      pnpm install --frozen-lockfile
    else

      pnpm install
    fi
    ;;
  yarn)

    if [ -f "$ProjectDir/yarn.lock" ]; then

      yarn install --frozen-lockfile
    else

      yarn install
    fi
    ;;
  esac
fi


# executing tests

echo "executing unit-tests via ${SisClr_Blue}${SisClr_Bold}$PackageManager test${SisClr_None} in '$ProjectDir' ..."

case "$PackageManager" in

npm)

  npm test
  ;;
pnpm)

  pnpm test
  ;;
yarn)

  yarn test
  ;;
esac


# ############################## end of file ############################# #
