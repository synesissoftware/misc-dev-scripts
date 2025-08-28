#! /bin/bash

# ######################################################################## #
# File:     run_all_unit_tests.sh
#
# Purpose:  Executes the unit-tests of a Python project regardless of
#           calling directory
#
# Created:  13th February 2019
# Updated:  28th August 2025
#
# Copyright (c) Matthew Wilson, 2019-2025
# All rights reserved
#
# Redistribution and use in Source and binary forms, with or without
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

  Dir="$(cd -P "$(dirname "$Source")" && pwd)"
  Source="$(readlink "$Source")"
  [[ $Source != /* ]] && Source="$Dir/$Source"
done
Dir="$(cd -P "$( dirname "$Source" )" && pwd)"

PossiblePythonCommands=(python3 python python2)


PythonCommandPath=



# regular command-line handling


while [[ $# -gt 0 ]]
do

  case "$1" in

    --python-cmd-path|-p)

      shift

      PythonCommandPath=$1
      ;;
    --help)

      cat << EOF
USAGE: $Source { | --help | [ --python <python-cmd-path> ] }

flags/options:

  --help
  shows this help and terminates

  -p <python-cmd-path>
  --python-cmd-path <python-cmd-path>
  specifies explicitly the path of the Python command to be executed (rather than discover it)
EOF

      exit 0
      ;;
    *)

      >&2 echo "unrecognised argument; use --help for usage"

      exit 1
      ;;
  esac

  shift
done


# validate / discover python executable path

if [ "x_$PythonCommandPath" != "x_" ]; then

  # check the given command

  if ! which "$PythonCommandPath" > /dev/null ; then

    >&2 echo "given python-cmd-path '$PythonCommandPath' is not executable"

    exit 1
  fi
else

  # try and find a suitable command

  if [ "x_$PythonCommandPath" = "x_" ]; then

    if [ "y_$PYTHON_COMMAND_PATH" != "y_" ]; then

      if which "$PYTHON_COMMAND_PATH" > /dev/null ; then

        PythonCommandPath=$PYTHON_COMMAND_PATH
      fi
    fi
  fi

  if [ "x_$PythonCommandPath" = "x_" ]; then

    if [ "y_$PYTHON_CMD_PATH" != "y_" ]; then

      if which "$PYTHON_CMD_PATH" > /dev/null ; then

        PythonCommandPath=$PYTHON_CMD_PATH
      fi
    fi
  fi

  if [ "x_$PythonCommandPath" = "x_" ]; then

    for p in "${PossiblePythonCommands[@]}"
    do

      if which "$p" > /dev/null ; then

        PythonCommandPath=$p

        echo "found validation python command '$p'"

        break
      fi
    done
  fi

  if [ "x_$PythonCommandPath" = "x_" ]; then

    >&2 echo "no valid python command path discovered"

    exit 1
  fi
fi


# executing tests


# This will operate recursively as long as each subdirectory of $Dir/tests
# contains an __init__.py file (which may be empty)
"$PythonCommandPath" -m unittest discover "$Dir/tests"


# ############################## end of file ############################# #

