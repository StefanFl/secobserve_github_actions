#!/bin/sh
set -e

cd "$GITHUB_WORKSPACE"
docker pull "$INPUT_TARGET"
grype docker:"$INPUT_TARGET" $INPUT_FURTHER_PARAMETERS --output cyclonedx-json --file "$INPUT_REPORT_NAME"

exit 0
