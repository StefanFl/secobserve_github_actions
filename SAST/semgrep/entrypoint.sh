#!/bin/sh
set -e

cd "$INPUT_RUN_DIRECTORY"
semgrep scan $INPUT_FURTHER_PARAMETERS --config=$INPUT_CONFIGURATION --metrics=off --no-error --output "$GITHUB_WORKSPACE/$INPUT_REPORT_NAME" --json "$INPUT_TARGET"
cd "$GITHUB_WORKSPACE"

exit 0
