{
  lib,
  pkgs,
  ...
}:

{
  packages = [ pkgs.asdf-vm ];

  git-hooks.hooks = {
    gitleaks = {
      enable = true;
      entry = lib.getExe pkgs.gitleaks;
      args = [ "git" ];
      always_run = true;
      stages = [ "post-commit" ];
    };
    shellcheck.enable = true;
    shfmt.enable = true;
  };
}
