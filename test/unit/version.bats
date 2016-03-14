#!/usr/bin/env bats

@test '-v should output version' {
  run build/bin/hykes-engine -v
  [ ${status} -eq 0 ]
  [ $(expr "${output}" : 'v*') -ne 0 ]
}

@test '--version should output version' {
  run build/bin/hykes-engine --version
  [ ${status} -eq 0 ]
  [ $(expr "${output}" : 'v*') -ne 0 ]
}
