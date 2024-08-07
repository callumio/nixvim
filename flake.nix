{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = {
    nixvim,
    flake-parts,
    nixpkgs,
    neovim-nightly-overlay,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nightly = import nixpkgs {
          inherit system;
          overlays = [];
          config.allowUnfree = true;
        };
        nixvimModule = {
          inherit pkgs;
          module = import ./config;
          extraSpecialArgs = {inherit nightly;};
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in {
        checks = {
          default =
            nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        packages = {default = nvim;};
      };
    };
}
