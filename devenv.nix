{ pkgs, ... }:

{
  packages = [
    pkgs.asdf-vm
    pkgs.semantic-release
  ];

  git-hooks.hooks = {
    shellcheck.enable = true;
    shfmt.enable = true;
  };
}
