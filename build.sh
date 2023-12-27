#!/usr/bin/env bash


build_configuration() {
  CONFIG="$1"
  echo "Building $CONFIG"
  BUILD_DIR="$(pwd)/build/$CONFIG"
  CONFIG_ABS_PATH="$(pwd)/build-configurations/$CONFIG"
  echo "BUILD_DIR: $BUILD_DIR"
  mkdir -p "$BUILD_DIR"
  pushd "$BUILD_DIR"
  env VERBOSE=1 make --file "$CONFIG_ABS_PATH/Makefile" BUILDROOT="$BUILD_DIR" --debug
  popd
}

CONFIG="$1"
if [[ -z "$CONFIG" ]] then
  for CONFIG_DIR in build-configurations/*; do
    build_configuration "$(basename "$CONFIG_DIR")"
  done
else
  build_configuration "$CONFIG"
fi

