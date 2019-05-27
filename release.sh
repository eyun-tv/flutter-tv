#!/usr/bin/env bash

_dirname=$(cd "$(dirname "$0")"; pwd)

cd $_dirname

#version=debug
version=release

flutter build apk --$version
fir publish build/app/outputs/apk/$version/app-$version.apk
