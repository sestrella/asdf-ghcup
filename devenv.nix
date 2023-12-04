{ pkgs, ... }:

{
  languages.javascript.enable = true;

  pre-commit.hooks = {
    shellcheck.enable = true;
    shfmt.enable = true;
  };
}
