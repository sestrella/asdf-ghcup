setup() {
  load 'test_helper/bats-assert/load'
  load 'test_helper/bats-support/load'
  ASDF_INSTALL_PATH=$(mktemp -dt asdf-XXXX)
}

teardown() {
  rm -rf "${ASDF_INSTALL_PATH}"
}

@test "install - cabal" {
  source ./bin/install
  ASDF_INSTALL_VERSION="3.6.2.0"
  main cabal
  run "${ASDF_INSTALL_PATH}/bin/cabal" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "install - ghc" {
  source ./bin/install
  ASDF_INSTALL_VERSION="9.2.1"
  main ghc
  run "${ASDF_INSTALL_PATH}/bin/ghc" --version
  assert_success
  assert_output --partial "${ASDF_INSTALL_VERSION}"
}

@test "list-all - cabal" {
  source ./bin/list-all
  run main cabal
  assert_success
  assert_output --partial "2.4.1.0"
  assert_output --partial "3.6.2.0"
}

@test "list-all - ghc" {
  source ./bin/list-all
  run main ghc
  assert_success
  assert_output --partial "8.10.7"
  assert_output --partial "9.2.1"
}

@test "list-all - stack" {
  source ./bin/list-all
  run main stack
  assert_success
  assert_output --partial "2.5.1"
  assert_output --partial "2.7.3"
}
