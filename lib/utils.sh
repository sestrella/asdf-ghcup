asdf_plugin_path() {
  echo "$(dirname "$(dirname "$0")")"
}

ghcup_bin_dir() {
  echo "$(asdf_plugin_path)/.ghcup/bin"
}

check_ghcup() {
  if ! test -f "$(ghcup_bin_dir)/ghcup"
  then
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | env \
      BOOTSTRAP_HASKELL_MINIMAL=1 \
      BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
      GHCUP_INSTALL_BASE_PREFIX="$(asdf_plugin_path)" \
      sh
  fi
}
