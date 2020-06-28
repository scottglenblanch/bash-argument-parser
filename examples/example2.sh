#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SRC_DIR="$(cd ${SCRIPT_PATH}; cd ../src; pwd -P)"
ARG_PARSER_PATH="${SRC_DIR}/arg-parser.sh"

echo "${SCRIPT_PATH}"

source "${ARG_PARSER_PATH}" --person Scott Blanch --power Coding

echo "--person parameter created variable
  \$PERSON: ${PERSON}"

echo "--power parameter created variable
  \$POWER: ${POWER}"
