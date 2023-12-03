# vi: ft=bash

setup() {
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'
  DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
  PATH="$DIR/../bin:$PATH"
  export ASDF_PLUGIN_PATH=$(mktemp -dt asdf-plugin-XXXX)
}

teardown() {
  rm -rf "$ASDF_PLUGIN_PATH"
  unset ASDF_PLUGIN_PATH
}

@test "cabal" {
  run list-all cabal
  assert_success
  assert_output --partial "3.8.1.0"
}

@test "ghc" {
  run list-all ghc
  assert_success
  assert_output --partial "9.4.2"
}

@test "hls" {
  run list-all hls
  assert_success
  assert_output --partial "1.7.0.0"
}

@test "stack" {
  run list-all stack
  assert_success
  assert_output --partial "2.7.5"
}
