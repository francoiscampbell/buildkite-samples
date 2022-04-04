#!/bin/bash

if [[ ! -z "$RUN_PIPELINE" ]]; then
  buildkite-agent pipeline upload "$RUN_PIPELINE/buildkite.yml"
else
  find . -name buildkite.yml -exec buildkite-agent pipeline upload {} \\;
fi