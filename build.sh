#!/usr/bin/env bash

set -euo pipefail

GIT_REV="135f6e3"

rm -rf binder
git clone https://github.com/RosettaCommons/binder
pushd binder
git checkout ${GIT_REV}
sed -i "s/llvm_version='4.0.0'/llvm_version='5.0.0'/" build.py
popd
docker build -t crs4/binder:${GIT_REV} .
