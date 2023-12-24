#!/usr/bin/env bash

for CONFIG_DIR in build-configurations/*; do
  BUILD_DIR="$(pwd)/build/$(basename "$CONFIG_DIR")"
  CONFIG_ABS_PATH="$(pwd)/$CONFIG_DIR"
  echo "BUILD_DIR: $BUILD_DIR"
  mkdir -p "$BUILD_DIR"
  pushd "$BUILD_DIR"
  env VERBOSE=1 make --file "$CONFIG_ABS_PATH/Makefile" BUILDROOT="$BUILD_DIR" --debug
  popd
done
