#!/usr/bin/env bash

asdf_plugin_path() {
	dirname "$(dirname "$0")"
}

ghcup_bin_dir() {
	echo "$(asdf_plugin_path)/.ghcup/bin"
}

ensure_ghcup() {
	if ! test -f "$(ghcup_bin_dir)/ghcup"; then
		curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | env \
			BOOTSTRAP_HASKELL_MINIMAL=1 \
			BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
			GHCUP_INSTALL_BASE_PREFIX="$(asdf_plugin_path)" \
			sh >/dev/null
	fi
}

ghcup_wrapper() {
	ensure_ghcup
	GHCUP_INSTALL_BASE_PREFIX="$(asdf_plugin_path)" "$(ghcup_bin_dir)/ghcup" "$@"
}

list_all_versions() {
	ghcup_wrapper list -t "$1" -r | awk '{printf $2 " "}'
}

install_version() {
	local tool version path version_prefix

	tool="$1"
	version="$2"
	path="$3"
	version_prefix=$(echo "$version" | awk -F '.' '{print $1 "." $2}')

	if [[ $tool == "ghc" ]] || { [[ $tool == "hls" ]] && [[ $(echo "$version_prefix >= 1.7" | bc) -eq 1 ]]; }; then
		ghcup_wrapper install "$tool" "$version" -i "$path"
	else
		ghcup_wrapper install "$tool" "$version" -i "${path}/bin"
	fi
}
