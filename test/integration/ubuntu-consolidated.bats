#!/usr/bin/env bats

# Sleep handles for DigitalOcean bug in which they report servers being up but truly are not.
function infrastructure-create() {
  hykes-provision create digitalocean --consolidated --dns=hosts --specs=small && sleep 30
}

function infrastructure-destroy() {
  hykes-provision destroy digitalocean --consolidated --dns=hosts
}

function infrastructure-exists() {
  hykes-provision exists digitalocean --consolidated
}

load lib/blueprint
load lib/engine
load lib/bats

@test 'hykes-engine key should exit 0' {
  run engine-key; if [ "${status}" -ne 0 ]; then bats-break-set; fi
  [ "${status}" -eq 0 ]
}

#Because this is the last test, we always want to set break to destroy infrastructure.
@test 'hykes-engine build --init should exit 0' {
  run engine-build-with-init; bats-break-set
  [ "${status}" -eq 0 ]
}
