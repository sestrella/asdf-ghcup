#!/usr/bin/env bash

asdf_plugin_path=$(realpath "$(dirname "$(dirname "$0")")")

install_ghcup() {
	local path="${asdf_plugin_path}/.ghcup/bin/ghcup"

	if [[ ! -x $path ]]; then
		echo "Installing ghcup at $asdf_plugin_path" >&2
		curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org |
			BOOTSTRAP_HASKELL_MINIMAL=1 \
				BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
				GHCUP_INSTALL_BASE_PREFIX="$asdf_plugin_path" \
				sh >&2
	fi

	echo "$path"
}

ghcup_wrapper() {
	if command -v ghcup >/dev/null 2>&1; then
		echo "Using ghcup found at $(which ghcup)" >&2
		ghcup "$@"
	else
		GHCUP_INSTALL_BASE_PREFIX="$asdf_plugin_path" "$(install_ghcup)" "$@"
	fi
}

list_all_versions() {
	local tool="$1"

	ghcup_wrapper list -t "$tool" -r
}

download_version() {
	local tool="$1"
	local version="$2"

	ghcup_wrapper prefetch "$tool" "$version"
}

install_version() {
	local tool="$1"
	local version="$2"
	local path="$3"

	ghcup_wrapper install "$tool" "$version" -i "$path"

	if [[ ! -d "${path}/bin" ]]; then
		echo "Moving $tool binaries from $path to ${path}/bin" >&2
		mkdir "${path}/bin"
		find "$path" -maxdepth 1 -type f -exec mv {} "${path}/bin/" \;
	fi
}
