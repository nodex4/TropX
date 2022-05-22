#!/usr/bin/env bash

:





set -E
set -o functrace
function handle_error {
    local retval=$?
    local line=${last_lineno:-$1}
    echo "Failed at $line: $BASH_COMMAND"
    echo "Trace: " "$@"
    exit $retval
}
if (( ${BASH_VERSION%%.*} <= 3 )) || [[ ${BASH_VERSION%.*} = 4.0 ]]; then
        trap '[[ $FUNCNAME = handle_error ]] || { last_lineno=$real_lineno; real_lineno=$LINENO; }' DEBUG
fi
trap 'handle_error $LINENO ${BASH_LINENO[@]}' ERR

fail() {
    echo "I expect the next line to be the failing line: $((LINENO + 1))"
    command_that_fails
}

fail