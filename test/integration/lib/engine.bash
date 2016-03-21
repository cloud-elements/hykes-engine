#!/usr/bin/env bash

function engine-build-with-init() {
  ../../bin/hykes-engine build --init \
    --elements-password=elements \
    --cesecurity-password=cesecurity \
    --master-encryption-password=master \
    --backup-encryption-password=backup
}

function engine-key() {
  ../../bin/hykes-engine key "$(whoami)" "${HYKES_ENGINE_KEY}" --as=root
}
