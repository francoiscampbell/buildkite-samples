#!/bin/bash

PARALLELISM=$(( ( RANDOM % 10 ) + 1 )) builkite-agent pipeline upload tests.yml