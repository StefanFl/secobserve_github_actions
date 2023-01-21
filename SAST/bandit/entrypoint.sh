#!/bin/sh
set -e

while getopts "t:r:d:p:" o; do
   case "${o}" in
       t)
         export TARGET=${OPTARG}
       ;;
       r)
         export REPORT_NAME=${OPTARG}
       ;;
       d)
         export RUN_DIRECTORY=${OPTARG}
       ;;
       p)
         export FURTHER_PARAMETERS=${OPTARG}
       ;;
  esac
done

echo $REPORT_NAME
echo $TARGET

# cd "$RUN_DIRECTORY"
bandit $FURTHER_PARAMETERS --format sarif --output "$HOME/$REPORT_NAME" --exit-zero --recursive "$TARGET"
# cd "$GITHUB_WORKSPACE"

exit 0
