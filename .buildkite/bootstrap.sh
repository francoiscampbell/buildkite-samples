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
  git diff --name-only | grep '/buildkite.yml$'
  git diff --name-only | grep '/buildkite.yml$' | xargs -I{} buildkite-agent pipeline upload {}
fi