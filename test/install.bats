# vi: ft=bash

setup() {
  load 'test_helper/bats-assert/load'
  load 'test_helper/bats-support/load'
  ASDF_INSTALL_PATH=$(mktemp -dt asdf-XXXX)
}

teardown() {
  rm -rf "${ASDF_INSTALL_PATH}"
}

@test "cabal 3.6.2.0" {
  source ./bin/install
  ASDF_INSTALL_VERSION="3.6.2.0"
  main cabal
  run "${ASDF_INSTALL_PATH}/bin/cabal" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "cabal 3.8.1.0" {
  source ./bin/install
  ASDF_INSTALL_VERSION="3.8.1.0"
  main cabal
  run "${ASDF_INSTALL_PATH}/bin/cabal" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "ghc 9.2.4" {
  source ./bin/install
  ASDF_INSTALL_VERSION="9.2.4"
  main ghc
  run "${ASDF_INSTALL_PATH}/bin/ghc" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "ghc 9.4.2" {
  source ./bin/install
  ASDF_INSTALL_VERSION="9.4.2"
  main ghc
  run "${ASDF_INSTALL_PATH}/bin/ghc" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "hls 1.6.1.0" {
  source ./bin/install
  ASDF_INSTALL_VERSION="1.6.1.0"
  main hls
  run "${ASDF_INSTALL_PATH}/bin/haskell-language-server-wrapper" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "hls 1.7.0.0" {
  source ./bin/install
  ASDF_INSTALL_VERSION="1.7.0.0"
  main hls
  run "${ASDF_INSTALL_PATH}/bin/haskell-language-server-wrapper" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "stack 2.5.1" {
  source ./bin/install
  ASDF_INSTALL_VERSION="2.5.1"
  main stack
  run "${ASDF_INSTALL_PATH}/bin/stack" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "stack 2.7.5" {
  source ./bin/install
  ASDF_INSTALL_VERSION="2.7.5"
  main stack
  run "${ASDF_INSTALL_PATH}/bin/stack" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}
