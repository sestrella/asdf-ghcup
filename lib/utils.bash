#!/usr/bin/env bash

asdf_plugin_path() {
  echo "$(dirname "$(dirname "$0")")"
}

ghcup_bin_dir() {
  echo "$(asdf_plugin_path)/.ghcup/bin"
}

ensure_ghcup() {
  if ! test -f "$(ghcup_bin_dir)/ghcup"
  then
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | env \
      BOOTSTRAP_HASKELL_MINIMAL=1 \
      BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
      GHCUP_INSTALL_BASE_PREFIX="$(asdf_plugin_path)" \
      sh > /dev/null
  fi
}

list_all_versions() {
  ensure_ghcup
  "$(ghcup_bin_dir)/ghcup" list -t "$1" -r | awk '{printf $2" "}'
}

ver() {
  echo "$1" | awk -F . '{ printf("%02d%02d", $1,$2); }'
}

install_version() {
  local tool="$1"
  local version="$2"
  local path="$3"

  ensure_ghcup

  if [[ "$tool" == "ghc" ]] || { [[ "$tool" == "hls"  ]] && [[ $(ver "$version") -ge $(ver "1.7") ]]; }
  then
    "$(ghcup_bin_dir)/ghcup" install "$tool" "$version" -i "$path"
  else
    "$(ghcup_bin_dir)/ghcup" install "$tool" "$version" -i "${path}/bin"
  fi
}
