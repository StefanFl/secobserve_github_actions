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

cd "$INPUT_RUN_DIRECTORY"
checkov $INPUT_FURTHER_PARAMETERS --quiet --compact --soft-fail --directory "$INPUT_TARGET" --output sarif
mv results.sarif "$WORKSPACE/$INPUT_REPORT_NAME"
cd "$WORKSPACE"

if [ "$SO_UPLOAD" == "true" ]; then
  source file_upload_observations.sh
fi

exit 0