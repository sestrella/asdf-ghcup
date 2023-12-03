ghcup_bin_dir() {
  echo "$ASDF_PLUGIN_PATH/.ghcup/bin"
}

check_ghcup() {
  if ! test -f "$(ghcup_bin_dir)/ghcup"
  then
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | env \
      BOOTSTRAP_HASKELL_MINIMAL=1 \
      BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
      GHCUP_INSTALL_BASE_PREFIX="$ASDF_PLUGIN_PATH" \
      sh
  fi
}
