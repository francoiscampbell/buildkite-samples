#!/bin/bash

if [[ ! -z "$RUN_PIPELINE" ]]; then
  echo "Running only $RUN_PIPELINE/buildkite.yml"
  buildkite-agent pipeline upload "$RUN_PIPELINE/buildkite.yml"
elif [[ ! -z "$RUN_ALL" ]]; then
  echo 'Running all pipelines in this repo'
  for FILE in */buildkite.yml; do
    buildkite-agent pipeline upload "$FILE"
  done
else
  echo "Running only changed pipelines:"
  git --no-pager diff --name-only HEAD~1 | grep '/buildkite.yml$'
  git --no-pager diff --name-only HEAD~1 | grep '/buildkite.yml$' | xargs -I{} buildkite-agent pipeline upload {}
fi