#!/bin/bash

INPUT="$@"

VARIABLE_KEY=""
VARIABLE_VALUE=""

is_word_a_key() {
  WORD="$1"

  [ "${WORD:0:2}" = "--" ] && echo 'true' || 'false'
}

get_keyname_from_word() {
  WORD="$1"
  WORD_LENGTH=${#WORD}
  WORD_NO_DASHES="${WORD:2:${WORD_LENGTH}}"
  WORD_UPPERCASE=$(echo "${WORD_NO_DASHES}" | tr [a-z] [A-Z])

  echo "${WORD_UPPERCASE}"
}

maybe_export_variable() {
  if [[ "${VARIABLE_KEY}" != "" ]]
  then
    eval "export ${VARIABLE_KEY}='${VARIABLE_VALUE}'"
  fi
}

handle_key_word() {
  WORD="$1"
  KEY_NAME=$(get_keyname_from_word "${WORD}")

  maybe_export_variable

  VARIABLE_KEY="${KEY_NAME}"
  VARIABLE_VALUE=""
}

handle_value_word() {
  WORD="$1"

  if [[ "${VARIABLE_VALUE}" == "" ]]
  then
    VARIABLE_VALUE="${WORD}"
  else
    VARIABLE_VALUE="${VARIABLE_VALUE} ${WORD}"
  fi
}

parse_word() {
  WORD="$1"

  if [[ "$(is_word_a_key "${WORD}")" = "true" ]]
  then
    handle_key_word "${WORD}"
  else
    handle_value_word "${WORD}"
  fi
}


for WORD in $INPUT
do
  parse_word "$WORD"
done

maybe_export_variable
