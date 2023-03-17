#!/bin/sh
set -e

sslyze $INPUT_FURTHER_PARAMETERS --json_out "$INPUT_REPORT_NAME" "$INPUT_TARGET"

exit 0
