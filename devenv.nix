{ pkgs, ... }:

{
  packages = [ pkgs.shfmt ];

  languages.javascript.enable = true;

  pre-commit.hooks.shellcheck.enable = true;
}
