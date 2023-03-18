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

git config --global --add safe.directory "$WORKSPACE"
cd "$RUN_DIRECTORY"
gitleaks detect $FURTHER_PARAMETERS --exit-code 0 --no-git --redact --report-format sarif --report-path "$WORKSPACE/$REPORT_NAME"
cd "$WORKSPACE"

if [ "$SO_UPLOAD" == "true" ]; then
  source file_upload_observations.sh
fi

exit 0