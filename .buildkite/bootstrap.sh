#!/bin/bash

if [[ ! -z "$RUN_PIPELINE" ]]; then
  echo "Running only $RUN_PIPELINE/buildkite.yml"
  buildkite-agent pipeline upload "$RUN_PIPELINE/buildkite.yml"
else
  echo 'Running all pipelines in this repo'
  for FILE in */buildkite.yml; do
    buildkite-agent pipeline upload "$FILE"
  done
fi