#!/bin/bash

if [[ ! -z "$RUN_PIPELINE" ]]; then
  echo "Running only $RUN_PIPELINE/buildkite.yml"
  buildkite-agent pipeline upload "$RUN_PIPELINE/buildkite.yml"
else
  echo 'Running all pipelines in this repo'
  find . -name buildkite.yml -exec buildkite-agent pipeline upload {} \;
fi