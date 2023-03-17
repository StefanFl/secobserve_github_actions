#!/bin/sh
set -e

cd "$RUN_DIRECTORY"
bandit $FURTHER_PARAMETERS --format sarif --output "$WORKSPACE/$REPORT_NAME" --exit-zero --recursive "$TARGET"
cd "$WORKSPACE"

exit 0