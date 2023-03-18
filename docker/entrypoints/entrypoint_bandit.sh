#!/bin/sh
set -e

if [[ -z "${GITHUB_WORKSPACE}" ]]; then
  if [[ -z "${CI_PROJECT_DIR}" ]]; then
    WORKSPACE=.
  else
    WORKSPACE="${CI_PROJECT_DIR}"
  fi
else
  WORKSPACE="${GITHUB_WORKSPACE}"
fi

cd "$RUN_DIRECTORY"
bandit $FURTHER_PARAMETERS --format sarif --output "$WORKSPACE/$REPORT_NAME" --exit-zero --recursive "$TARGET"
cd "$WORKSPACE"

if [ "$SO_UPLOAD" == "true" ]; then
  source file_upload_observations.sh
fi

exit 0
