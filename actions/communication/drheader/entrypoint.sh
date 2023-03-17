#!/bin/sh
set -e

drheader scan single $INPUT_FURTHER_PARAMETERS --no-error --rules "$INPUT_RULES" --json "$INPUT_TARGET" >"$INPUT_REPORT_NAME"

exit 0
