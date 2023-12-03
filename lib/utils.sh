check_ghcup() {
  if ! command -v ghcup &> /dev/null
  then
    echo "GHCup not found, installing..."
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | env \
      BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
      BOOTSTRAP_HASKELL_MINIMAL=1 \
      sh
  fi
}
