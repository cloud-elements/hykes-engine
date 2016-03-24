#!/usr/bin/env bash

function engine-build-with-init() {
  (cd build/var/tmp/hykes-spec; \
    ../../../bin/hykes-engine build --init \
      --elements-password=elements \
      --cesecurity-password=cesecurity \
      --master-encryption-password=master \
      --backup-encryption-password=backup)
}

function engine-key() {
  (cd build/var/tmp/hykes-spec; \
    ../../../bin/hykes-engine key "$(whoami)" "${HYKES_ENGINE_KEY}" --as=root)
}
