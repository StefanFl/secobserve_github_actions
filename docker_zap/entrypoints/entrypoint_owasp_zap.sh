#!/bin/bash
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

cd "$WORKSPACE"
mkdir /zap/wrk
/zap/$SCRIPT -t "$TARGET" $FURTHER_PARAMETERS -J "$REPORT_NAME" || true
cp /zap/wrk/"$REPORT_NAME" .

if [ "$SO_UPLOAD" == "true" ]; then
  source file_upload_observations.sh
fi

exit 0
