# asdf-ghcup

[![CI](https://github.com/sestrella/asdf-ghcup/actions/workflows/ci.yml/badge.svg)](https://github.com/sestrella/asdf-ghcup/actions/workflows/ci.yml)

Simple [ghcup][ghcup] wrapper.

## Requirements

- [asdf](https://github.com/asdf-vm/asdf)
- [ghcup][ghcup]

## Supported Tools

### [cabal](https://www.haskell.org/cabal/)

```
asdf plugin add cabal https://github.com/sestrella/asdf-ghcup.git
```

### [ghc](https://www.haskell.org/ghc/)

```
asdf plugin add ghc https://github.com/sestrella/asdf-ghcup.git
```

### [hls](https://github.com/haskell/haskell-language-server)

```
asdf plugin add hls https://github.com/sestrella/asdf-ghcup.git
```

### [stack](https://docs.haskellstack.org/en/stable/README/)

```
asdf plugin add stack https://github.com/sestrella/asdf-ghcup.git
```

## References

This project was inspired by:

- [asdf-pyapp](https://github.com/amrox/asdf-pyapp)
- [asdf-rust](https://github.com/asdf-community/asdf-rust)

## License

[MIT](LICENSE)

[ghcup]: https://www.haskell.org/ghcup/
