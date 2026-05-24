# asdf-ghcup

[![build](https://github.com/sestrella/asdf-ghcup/actions/workflows/build.yml/badge.svg)](https://github.com/sestrella/asdf-ghcup/actions/workflows/build.yml)
[![release](https://github.com/sestrella/asdf-ghcup/actions/workflows/release.yml/badge.svg)](https://github.com/sestrella/asdf-ghcup/actions/workflows/release.yml)

An [asdf](https://github.com/asdf-vm/asdf) plugin for managing Haskell tools based on [GHCup](https://www.haskell.org/ghcup/). Simplify version management of Haskell toolchain components.

## Supported Tools

- [ghc](https://www.haskell.org/ghc) - The Glasgow Haskell Compiler
- [cabal](https://www.haskell.org/cabal) - The Haskell package and project build tool
- [stack](https://docs.haskellstack.org/en/stable/) - Cross-platform program for developing Haskell projects
- [hls](https://github.com/haskell/haskell-language-server) - Language Server Protocol implementation for Haskell

## Requirements

- [asdf](https://github.com/asdf-vm/asdf) - version manager framework
- GHCup [system requirements](https://www.haskell.org/ghcup/install/#system-requirements)

## Installation

### Add the plugin

Replace `<tool>` with any of the supported tools above:

```sh
asdf plugin add <tool>
```

**Examples:**

```sh
asdf plugin add ghc
asdf plugin add cabal
asdf plugin add stack
asdf plugin add hls
```

## Usage

### List available versions

```sh
asdf list all <tool>
```

### Install a specific version

```sh
asdf install <tool> <version>
```

### Set global or local version

```sh
asdf global <tool> <version>
asdf local <tool> <version>
```

For more information on asdf commands, see the [asdf documentation](https://asdf-vm.com/guide/getting-started.html).

## Credits

This project was heavily inspired by:

- [asdf-plugin-template](https://github.com/asdf-vm/asdf-plugin-template)
- [asdf-pyapp](https://github.com/amrox/asdf-pyapp)
- [asdf-ruby](https://github.com/asdf-vm/asdf-ruby)
- [asdf-rust](https://github.com/asdf-community/asdf-rust)

## License

[MIT](LICENSE)
