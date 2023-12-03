# vi: ft=bash

setup() {
  load 'test_helper/bats-assert/load'
  load 'test_helper/bats-support/load'
  DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
  PATH="$DIR/../bin:$PATH"
}

@test "cabal" {
  list-all
  run main cabal
  assert_success
  assert_output --partial "3.8.1.0"
}

# @test "ghc" {
#   source ./bin/list-all
#   run main ghc
#   assert_success
#   assert_output --partial "9.4.2"
# }
#
# @test "hls" {
#   source ./bin/list-all
#   run main hls
#   assert_success
#   assert_output --partial "1.7.0.0"
# }
#
# @test "stack" {
#   source ./bin/list-all
#   run main stack
#   assert_success
#   assert_output --partial "2.7.5"
# }
