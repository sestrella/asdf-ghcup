setup() {
  load 'test_helper/bats-assert/load'
  load 'test_helper/bats-support/load'
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
