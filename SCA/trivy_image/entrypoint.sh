#!/bin/sh
set -e

cd "$GITHUB_WORKSPACE"
docker pull "$INPUT_TARGET"
trivy image $INPUT_FURTHER_PARAMETERS --exit-code 0 --format cyclonedx --security-checks vuln --output "$INPUT_REPORT_NAME "$INPUT_TARGET"

exit 0
