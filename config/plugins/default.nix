{ self, config, ... }: {
  imports = [
    ./cmp.nix
    ./dap.nix
    ./harpoon.nix
    ./lsp.nix
    ./lualine.nix
    ./none-ls.nix
    ./oil.nix
    ./rust.nix
    ./telescope.nix
    ./treesitter.nix
  ];
  plugins = {
    comment-nvim.enable = true;
    copilot-lua = {
      enable = true;
      suggestion.enabled = false;
      panel.enabled = false;
    };
    copilot-cmp.enable = true;
    crates-nvim.enable = true;
    gitsigns.enable = true;
    leap.enable = true;
    nvim-autopairs.enable = true;
    surround.enable = true;
    todo-comments.enable = true;
    undotree.enable = true;
    nix.enable = true;
  };
}
