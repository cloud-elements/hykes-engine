#!/usr/bin/env bats

load lib/bats

@test '-h should output usage' {
  run build/bin/hykes-engine -h
  [ "${status}" -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}

@test '--help should output usage' {
  run build/bin/hykes-engine --help
  [ "${status}" -eq 0 ]
  [ "${#lines[@]}" -gt 1 ]
}
