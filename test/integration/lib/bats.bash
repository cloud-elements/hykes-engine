#!/usr/bin/env bash

function bats-break() {
  [ -f build/var/tmp/hykes-engine.bats.lock ]
}

function bats-break-set() {
  touch build/var/tmp/hykes-engine.bats.lock
}

function bats-break-unset() {
  rm -f build/var/tmp/hykes-engine.bats.lock
}

function bats-test-first() {
  [ "${BATS_TEST_NUMBER}" -eq 1 ]
}

function blueprint-clone() {
  git clone git@github.com:cloud-elements/hykes-spec.git build/var/tmp/hykes-spec
  (cd build/var/tmp/hykes-spec; \
    git checkout $(git describe --tags $(git rev-list --tags --max-count=1)))
}

function blueprint-exists() {
 [ -d build/var/tmp/hykes-spec ]
}

function setup() {
  if ! blueprint-exists; then blueprint-clone; fi
  if bats-test-first; then bats-break-unset; fi
  if bats-break; then skip; else if ! infrastructure-exists; then infrastructure-create; fi; fi
}

function teardown() {
  if [ -n "${BATS_TEST_NAME}" ]; then
    echo "${BATS_TEST_NAME}" >> build/var/log/hykes-engine.bats.log
    echo "${output}" >> build/var/log/hykes-engine.bats.log
  fi
  if bats-break && infrastructure-exists; then infrastructure-destroy; fi
}

trap "teardown" SIGINT SIGTERM
