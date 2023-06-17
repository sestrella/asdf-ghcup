{
  inputs = {
    devenv.url = "github:cachix/devenv";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    systems.url = "github:nix-systems/default";
  };

  outputs = inputs@{ self, devenv, nixpkgs, nixpkgs-master, systems, ... }:
    let
      forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      devShells = forEachSystem
        (system:
          let
            pkgs = nixpkgs.legacyPackages.${system};
            pkgs-master = nixpkgs-master.legacyPackages.${system};
          in
          {
            release = devenv.lib.mkShell {
              inherit inputs pkgs;
              modules = [{
                packages = [
                  pkgs-master.semantic-release
                ];
              }];
            };

            default = devenv.lib.mkShell {
              inherit inputs pkgs;
              modules = [{
                # https://devenv.sh/reference/options/
                packages = [
                  pkgs.shellcheck
                ];

                languages.javascript.enable = true;

                pre-commit.hooks.shellcheck.enable = true;
              }];
            };
          });
    };
}
