#!/usr/bin/env bash

for CONFIG_DIR in build-configurations/*; do
  BUILD_DIR="build/$(basename "$CONFIG_DIR")"
  mkdir -p "$BUILD_DIR"
  make -C "$CONFIG_DIR" BUILDROOT="$BUILD_DIR"
done
