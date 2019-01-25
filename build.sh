#!/usr/bin/env bash

# we mount script's dir as /work
CURR_DIR=$(dirname "$0")
CURR_DIR=$( cd "$MY_PATH" && pwd )  # absolutized and normalized
docker run -i --rm -e BUILD_NUMBER=$BUILD_NUMBER -v $CURR_DIR:/work keksdev/godot:3.1b2 /work/deploy.sh
