# asdf-ghcup

[![build](https://github.com/sestrella/asdf-ghcup/actions/workflows/build.yml/badge.svg)](https://github.com/sestrella/asdf-ghcup/actions/workflows/build.yml)
[![release](https://github.com/sestrella/asdf-ghcup/actions/workflows/release.yml/badge.svg)](https://github.com/sestrella/asdf-ghcup/actions/workflows/release.yml)

An asdf plugin wrapping [GHCup](https://www.haskell.org/ghcup).

## Requirements

- Install [asdf](https://github.com/asdf-vm/asdf)

## Getting Started

At the moment, the following Haskell tools are supported by this plugin:

- [cabal](https://www.haskell.org/cabal)
- [ghc](https://www.haskell.org/ghc)
- [hls](https://github.com/haskell/haskell-language-server)
- [stack](https://docs.haskellstack.org/en/stable/README)

Run the following command replacing `<tool>` with one of the tools listed
above:

```sh
asdf plugin add <tool> https://github.com/sestrella/asdf-ghcup.git
```

## Credits

This project was heavily inspired by:

- [asdf-plugin-template](https://github.com/asdf-vm/asdf-plugin-template)
- [asdf-pyapp](https://github.com/amrox/asdf-pyapp)
- [asdf-ruby](https://github.com/asdf-vm/asdf-ruby)
- [asdf-rust](https://github.com/asdf-community/asdf-rust)

## License

[MIT](LICENSE)
