{
  config,
  lib,
  pkgs,
  ...
}:

{
  env.GEMINI_API_KEY = config.secretspec.secrets.GEMINI_API_KEY or "";

  packages = [ pkgs.asdf-vm ];

  git-hooks.hooks = {
    autocommitmsg = {
      enable = true;
      entry = lib.getExe pkgs.autocommitmsg;
      stages = [ "prepare-commit-msg" ];
    };
    gitleaks = {
      enable = true;
      entry = lib.getExe pkgs.gitleaks;
      stages = [ "post-commit" ];
    };
    shellcheck.enable = true;
    shfmt.enable = true;
  };
}
