{
  config,
  lib,
  pkgs,
  ...
}:

{
  env.GEMINI_API_KEY = config.secretspec.secrets.GEMINI_API_KEY or "";

  git-hooks.hooks = {
    autocommitmsg = {
      enable = true;
      entry = lib.getExe pkgs.autocommitmsg;
      stages = [ "prepare-commit-msg" ];
      verbose = true;
    };
    shellcheck.enable = true;
    shfmt.enable = true;
  };
}
