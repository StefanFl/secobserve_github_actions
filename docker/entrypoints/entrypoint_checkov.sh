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

echo "$RUN_DIRECTORY"
echo "$TARGET"
echo "$WORKSPACE"
echo "$WORKSPACE/$REPORT_NAME"

cd "$RUN_DIRECTORY"
pwd
checkov $FURTHER_PARAMETERS --quiet --compact --soft-fail --directory "$TARGET" --output sarif
ls
mv results.sarif "$WORKSPACE/$REPORT_NAME"
cd "$WORKSPACE"
pwd

if [ "$SO_UPLOAD" == "true" ]; then
  source file_upload_observations.sh
fi

exit 0