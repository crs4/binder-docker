#!/usr/bin/env bash

set -euo pipefail

GIT_REV="v1.2.0"

rm -rf binder
git clone https://github.com/RosettaCommons/binder
pushd binder
git checkout ${GIT_REV}
popd
docker build -t crs4/binder:${GIT_REV} .
