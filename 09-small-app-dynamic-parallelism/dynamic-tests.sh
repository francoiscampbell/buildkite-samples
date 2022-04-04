#!/bin/bash

PARALLELISM=$(( ( RANDOM % 10 ) + 1 )) buildkite-agent pipeline upload tests.yml