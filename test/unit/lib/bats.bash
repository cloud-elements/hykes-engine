#!/usr/bin/env bash

function teardown() {
  echo "${BATS_TEST_NAME}" >> build/var/log/hykes-engine.bats.log
  echo "${output}" >> build/var/log/hykes-engine.bats.log
}
