#!/bin/sh
set -e

git config --global --add safe.directory "$GITHUB_WORKSPACE"
cd "$INPUT_RUN_DIRECTORY"
gitleaks detect $INPUT_FURTHER_PARAMETERS --exit-code 0 --no-git --redact --report-format sarif --report-path "$GITHUB_WORKSPACE/$INPUT_REPORT_NAME"
cd "$GITHUB_WORKSPACE"

exit 0
