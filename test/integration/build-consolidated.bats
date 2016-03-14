load suite

@test 'init should succeed' {
  build/bin/hykes-engine init \
    --blueprint="${HYKES_ENGINE_BLUEPRINT}" \
    --password="${HYKES_ENGINE_PASSWORD}" \
    --token="${HYKES_ENGINE_TOKEN}"
}

@test 'key should succeed' {
  build/bin/hykes-engine key \
    "${HYKES_ENGINE_USERNAME}" \
    "https://github.com/${HYKES_ENGINE_USERNAME}.keys" \
    --as=root \
  || build/bin/hykes-engine key \
    "${HYKES_ENGINE_USERNAME}" \
    "https://github.com/${HYKES_ENGINE_USERNAME}.keys" \
    --as="${HYKES_ENGINE_USERNAME}"
}

@test 'build should succeed' {
  build/bin/hykes-engine build --as="${HYKES_ENGINE_USERNAME}"
}
