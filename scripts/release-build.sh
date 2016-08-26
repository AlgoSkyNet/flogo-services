#!/usr/bin/env bash
unset SCRIPT_ROOT
readonly SCRIPT_ROOT=$(
  unset CDPATH
  script_root=$(dirname "${BASH_SOURCE}")
  cd "${script_root}"
  pwd
)
source ${SCRIPT_ROOT}/init.sh
# Build flogo/flogo-web docker image
pushd ${BUILD_ROOT}
docker::build_file Dockerfile-flow-service flogo/flow-service
docker::build_file Dockerfile-flow-state-service flogo/state-service
# docker::copy_tag_and_push flogo/flogo-cli pdhar/flogo-cli
popd
