# vi: ft=bash

setup() {
  load 'test_helper/bats-assert/load'
  load 'test_helper/bats-support/load'
  ASDF_INSTALL_PATH=$(mktemp -dt asdf-XXXX)
}

teardown() {
  rm -rf "${ASDF_INSTALL_PATH}"
}

@test "cabal" {
  source ./bin/install
  ASDF_INSTALL_VERSION="3.8.1.0"
  main cabal
  run "${ASDF_INSTALL_PATH}/bin/cabal" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "install - ghc" {
  source ./bin/install
  ASDF_INSTALL_VERSION="9.4.2"
  main ghc
  run "${ASDF_INSTALL_PATH}/bin/ghc" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "hls" {
  source ./bin/install
  ASDF_INSTALL_VERSION="1.7.0.0"
  main hls
  run "${ASDF_INSTALL_PATH}/bin/hls" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "stack" {
  source ./bin/install
  ASDF_INSTALL_VERSION="2.7.5"
  main stack
  run "${ASDF_INSTALL_PATH}/bin/stack" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}
