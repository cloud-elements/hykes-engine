#!/usr/bin/env bats

@test '-h should output usage' {
  curl -f -k -v --silent https://console.pen.ops.cloud-elements.com/elements/jsp/login.jsp 2>&1 | \
  grep -q 'Cloud Elements'
}
