#!/usr/bin/env bash

function bats-break() {
  test -f "${BATS_TMPDIR}/.bats-break"
}

function bats-break-set() {
  touch "${BATS_TMPDIR}/.bats-break"
}

function bats-break-unset() {
  rm -f "${BATS_TMPDIR}/.bats-break"
}

function bats-test-first() {
  test "${BATS_TEST_NUMBER}" -eq 1
}

function setup() {
  if ! blueprint-exists; then blueprint-clone; fi; cd build/tmp/hykes-spec
  if bats-test-first; then bats-break-unset; fi
  if bats-break; then skip; else if ! infrastructure-exists; then infrastructure-create; fi; fi
}

function teardown() {
  echo "${output}" >> /tmp/hykes-engine.bats.log
  if bats-break && infrastructure-exists; then infrastructure-destroy; fi
}
