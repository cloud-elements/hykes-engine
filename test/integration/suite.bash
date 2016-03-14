#!/usr/bin/env bash

function only-env() {
  if [ -z "${HYKES_ENGINE_BLUEPRINT}" ] || \
     [ -z "${HYKES_ENGINE_PASSWORD}" ] || \
     [ -z "${HYKES_ENGINE_TOKEN}" ] || \
     [ -z "${HYKES_ENGINE_USERNAME}" ]; then

    skip 'Environment variables should be available'
  fi
}

function setup() {
  only-env && sleep 15 # Poor man's throttle
}
