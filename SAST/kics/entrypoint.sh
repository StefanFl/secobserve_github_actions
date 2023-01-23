#!/bin/sh
set -e

cd "$INPUT_RUN_DIRECTORY"
kics scan $INPUT_FURTHER_PARAMETERS --no-progress --ignore-on-exit results --queries-path /usr/local/kics/queries --path "$INPUT_TARGET" --report-formats sarif --output-path . --output-name "$GITHUB_WORKSPACE/$INPUT_REPORT_NAME"
cd "$GITHUB_WORKSPACE"

exit 0
