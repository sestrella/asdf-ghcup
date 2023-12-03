# vi: ft=bash

setup() {
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'
  DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
  PATH="$DIR/../bin:$PATH"
  export ASDF_INSTALL_PATH=$(mktemp -dt asdf-XXXX)
}

teardown() {
  rm -rf "${ASDF_INSTALL_PATH}"
  unset ASDF_INSTALL_PATH
}

@test "cabal 3.6.2.0" {
  ASDF_INSTALL_VERSION="3.6.2.0" install cabal
  run "${ASDF_INSTALL_PATH}/bin/cabal" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "cabal 3.8.1.0" {
  ASDF_INSTALL_VERSION="3.8.1.0" install cabal
  run "${ASDF_INSTALL_PATH}/bin/cabal" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "ghc 9.2.4" {
  ASDF_INSTALL_VERSION="9.2.4" install ghc
  run "${ASDF_INSTALL_PATH}/bin/ghc" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "ghc 9.4.2" {
  ASDF_INSTALL_VERSION="9.4.2" install ghc
  run "${ASDF_INSTALL_PATH}/bin/ghc" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "hls 1.6.1.0" {
  ASDF_INSTALL_VERSION="1.6.1.0" install hls
  run "${ASDF_INSTALL_PATH}/bin/haskell-language-server-wrapper" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "hls 1.7.0.0" {
  ASDF_INSTALL_VERSION="1.7.0.0" install hls
  run "${ASDF_INSTALL_PATH}/bin/haskell-language-server-wrapper" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "stack 2.5.1" {
  ASDF_INSTALL_VERSION="2.5.1" install stack
  run "${ASDF_INSTALL_PATH}/bin/stack" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "stack 2.7.5" {
  ASDF_INSTALL_VERSION="2.7.5" install stack
  run "${ASDF_INSTALL_PATH}/bin/stack" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}
