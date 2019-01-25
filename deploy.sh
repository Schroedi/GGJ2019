#!/usr/bin/env bash

EXPORT_NAME=GGJ18-$BUILD_NUMBER

cd $(dirname "$0")
mkdir -v -p build/linux
mkdir -v -p build/windows
mkdir -v -p build/mac
mkdir -v -p build/web
  
godot -v --export "Linux/X11" ./build/linux/$EXPORT_NAME.x64
