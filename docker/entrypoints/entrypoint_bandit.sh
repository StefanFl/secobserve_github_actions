#!/bin/sh
set -e

if [[ -z "${GITHUB_WORKSPACE}" ]]; then
  WORKSPACE=.
else
  WORKSPACE="${GITHUB_WORKSPACE}"
fi

cd "$RUN_DIRECTORY"
bandit $FURTHER_PARAMETERS --format sarif --output "$WORKSPACE/$REPORT_NAME" --exit-zero --recursive "$TARGET"
cd "$WORKSPACE"

exit 0