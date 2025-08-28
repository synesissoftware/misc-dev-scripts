#! /bin/bash

# ######################################################################## #
# File:     run_all_unit_tests.sh
#
# Purpose:  Executes the unit-tests of a Ruby project regardless of
#           calling directory, allowing use of debug mode, warnings, and
#           executing each rbenv version
#
# Created:  9th June 2011
# Updated:  28th August 2025
#
# Copyright (c) Matthew Wilson, 2011-2025
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
Basename="$(basename $Source)"


# colours

if command -v tput > /dev/null; then

  RbEnvClr_Blue=${FG_BLUE:-$(tput setaf 4)}
  RbEnvClr_Red=${FG_BLUE:-$(tput setaf 1)}
  RbEnvClr_Bold=${FD_BOLD:-$(tput bold)}
  RbEnvClr_None=${FD_NONE:-$(tput sgr0)}
else

  RbEnvClr_Blue=
  RbEnvClr_Red=
  RbEnvClr_Bold=
  RbEnvClr_None=
fi


# special command-line handling ('--pwd')

ProjectDir="$ScriptDir"

for arg in "$@"
do

  case "$arg" in

  --pwd)

    ProjectDir=$(pwd)
    ;;
  *)

    Arguments="$Arguments $arg"
    ;;
  esac
done


# special command-line handling ('--rbenv-versions')
# rbenv handling

Arguments=
FoundHelp=
RunRbEnvAllVersions=

for arg in "$@"
do

  case "$arg" in

  --help)

    FoundHelp=1
    Arguments="$Arguments $arg"
    ;;
  --rbenv-versions)

    RunRbEnvAllVersions=1
    ;;
  *)

    Arguments="$Arguments $arg"
    ;;
  esac
done

if [ ! -z "$FoundHelp" ]; then

  RunRbEnvAllVersions=
fi

if [ ! -z "$RunRbEnvAllVersions" ]; then

  if ! command -v rbenv > /dev/null; then

  >&2 echo "$0: ${RbEnvClr_Red}${RbEnvClr_Bold}rbenv${RbEnvClr_None} not detected"

  exit 1
  fi

  if [ ! -e "$ProjectDir/.ruby-version" ];then

  >&2 echo "$0: ${RbEnvClr_Red}${RbEnvClr_Bold}.ruby-version${RbEnvClr_None} file not detected"

  exit 1
  fi

  exclusions=()
  if [ -e "$ProjectDir/.ruby-version-exclusions" ]; then

  exclusion_lines=`cat "$ProjectDir/.ruby-version-exclusions"`
  for line in $exclusion_lines; do

    exclusions+=($line)
  done
  fi

  echo "executing command line '${RbEnvClr_Blue}${RbEnvClr_Bold}$0 $Arguments${RbEnvClr_None}' with all Ruby versions ..."

  current=$(rbenv local)

  versions=()
  while IFS= read -r line; do

  versions+=("$line")
  done < <(rbenv versions --bare)

  echo "versions: ${RbEnvClr_Blue}${RbEnvClr_Bold}${versions[*]}${RbEnvClr_None}; skipped versions: ${RbEnvClr_Blue}${RbEnvClr_Bold}${exclusions[*]}${RbEnvClr_None}; current version: ${RbEnvClr_Blue}${RbEnvClr_Bold}${current}${RbEnvClr_None}"

  result=0

  for version in ${versions[@]}
  do

  echo

  skip=

  for exclusion in "${exclusions[@]}"; do

    if [[ "$exclusion" == "$version" ]]; then

    skip=1
    fi
  done

  if [ "$skip" != "" ]; then

    echo "skipping Ruby version ${RbEnvClr_Blue}${RbEnvClr_Bold}$version${RbEnvClr_None}:"
  else

    echo "processing Ruby version ${RbEnvClr_Blue}${RbEnvClr_Bold}$version${RbEnvClr_None}:"

    echo -e "\texecuting command line '$0 $Arguments' with Ruby version $version ..."
    rbenv local $version

    if ! $0 $Arguments; then

    result=1
    fi
  fi
  done

  rbenv local $current

  exit $result
fi


# regular command-line handling

Separate=
DebugFlag=
WarningsFlag=-W0

for v in "$@"
do

  case "$v" in

    --debug)

      DebugFlag=--debug
      ;;
    --help)

      cat << EOF
USAGE: $Basename { | --help | [ --debug ] [ --pwd ] [ --rbenv-versions ] [ --separate ] [ --warnings ]}

flags:

  --help
  shows this help and terminates

  --debug
  executes Ruby interpreter in debug mode

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
    --pwd)

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

if [ -z "$Separate" ]; then

  ruby $DebugFlag $WarningsFlag "$ProjectDir/test/unit/ts_all.rb"
else

  find "$ProjectDir" -name 'tc_*.rb' -exec ruby $DebugFlag $WarningsFlag {} \;
fi


# ############################## end of file ############################# #

