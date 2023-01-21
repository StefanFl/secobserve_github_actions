#!/bin/sh
set -e

cd "$INPUT_RUN_DIRECTORY"
bandit $INPUT_FURTHER_PARAMETERS --format sarif --output "$GITHUB_WORKSPACE/$INPUT_REPORT_NAME" --exit-zero --recursive "$INPUT_TARGET"
cd "$GITHUB_WORKSPACE"

exit 0
