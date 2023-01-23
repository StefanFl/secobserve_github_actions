#!/bin/sh
set -e

cd "$INPUT_RUN_DIRECTORY"
checkov $INPUT_FURTHER_PARAMETERS --quiet --compact --soft-fail --directory "$INPUT_TARGET" --output sarif
mv results.sarif "$GITHUB_WORKSPACE/$INPUT_REPORT_NAME"
cd "$GITHUB_WORKSPACE"

exit 0
