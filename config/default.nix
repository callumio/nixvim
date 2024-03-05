{ self, config, pkgs, nightly, ... }: {
  imports = [ ./options.nix ./keymaps.nix ./plugins ];
  package = nightly.neovim-nightly;
}
