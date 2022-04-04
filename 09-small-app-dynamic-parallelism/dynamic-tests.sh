#!/bin/bash

PARALLELISM=$(( ( RANDOM % 10 ) + 1 )) buildkite-agent pipeline upload 09-small-app-dynamic-parallelism/tests.yml