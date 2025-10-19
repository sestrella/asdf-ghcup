# asdf-ghcup

[![Build](https://github.com/sestrella/asdf-ghcup/actions/workflows/build.yml/badge.svg)](https://github.com/sestrella/asdf-ghcup/actions/workflows/build.yml)
[![Release](https://github.com/sestrella/asdf-ghcup/actions/workflows/release.yml/badge.svg)](https://github.com/sestrella/asdf-ghcup/actions/workflows/release.yml)

An asdf plugin for managing Haskell tools based on
[GHCup](https://www.haskell.org/ghcup/).

## Requirements

- Install [asdf](https://github.com/asdf-vm/asdf)
- Install GHCup [system requirements](https://www.haskell.org/ghcup/install/#system-requirements)

## Getting Started

The following Haskell tools are supported by this plugin:

- [cabal](https://www.haskell.org/cabal)
- [ghc](https://www.haskell.org/ghc)
- [hls](https://github.com/haskell/haskell-language-server)
- [stack](https://docs.haskellstack.org/en/stable/)

Run the following command replacing `<tool>` with one of the tools listed
above:

```sh
asdf plugin add <tool>
```

## Usage

After one of the supported tools has been added, you can run the following
commands:

**List all available versions:**

```sh
asdf list all <tool>
```

**Install a specific version:**

```sh
asdf install <tool> <version>
```

## Credits

This project was heavily inspired by:

- [asdf-plugin-template](https://github.com/asdf-vm/asdf-plugin-template)
- [asdf-pyapp](https://github.com/amrox/asdf-pyapp)
- [asdf-ruby](https://github.com/asdf-vm/asdf-ruby)
- [asdf-rust](https://github.com/asdf-community/asdf-rust)

## License

[MIT](LICENSE)
