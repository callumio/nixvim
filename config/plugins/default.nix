{ self, config, pkgs, ... }: {
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
    ./presence.nix
    ./conform.nix
    ./lint.nix
  ];
  plugins = {
    comment.enable = true;
    copilot-vim.enable = true;
    crates-nvim.enable = true;
    fidget.enable = true;
    gitsigns.enable = true;
    leap.enable = true;
    nvim-autopairs.enable = true;
    surround.enable = true;
    todo-comments.enable = true;
    undotree.enable = true;
    nix.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [ nvim-web-devicons haskell-tools-nvim ];

  extraPackages = with pkgs; [
    haskellPackages.haskell-language-server
    ghc
    haskellPackages.haskell-debug-adapter

    lldb
  ];

}
