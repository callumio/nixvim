{
  config,
  lib,
  pkgs,
  ...
}: {
  extraPackages = map (let
    mapping = with pkgs; {
      golangcilint = golangci-lint;
      inherit (nodePackages) jsonlint;
    };
  in
    pkg:
      if lib.hasAttr pkg mapping
      then mapping.${pkg}
      else pkgs.${pkg})
  (lib.flatten (lib.attrValues config.plugins.lint.lintersByFt));

  plugins.lint = {
    enable = true;
    lintersByFt = {
      go = ["golangcilint"];
      markdownlint = ["markdownlint-cli2"];
      nix = ["deadnix" "nix" "statix"];
      lua = ["selene"];
      sh = ["shellcheck" "shellharden"];
      python = ["ruff"];
      javascript = ["eslint_d"];
      javascriptreact = ["eslint_d"];
      typescript = ["eslint_d"];
      typescriptreact = ["eslint_d"];
      json = ["jsonlint"];
    };
  };
}
