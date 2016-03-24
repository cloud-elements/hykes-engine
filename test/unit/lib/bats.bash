#!/usr/bin/env bash

function teardown() {
  if [ -n "${BATS_TEST_NAME}" ]; then
    echo "${BATS_TEST_NAME}" >> build/var/log/hykes-engine.bats.log
    echo "${output}" >> build/var/log/hykes-engine.bats.log
  fi
}
