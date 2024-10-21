{
  self,
  config,
  pkgs,
  ...
}: {
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
    crates-nvim.enable = true;
    fidget.enable = true;
    gitsigns.enable = true;
    leap.enable = true;
    nvim-autopairs.enable = true;
    vim-surround.enable = true;
    todo-comments.enable = true;
    undotree.enable = true;
    nix.enable = true;
    web-devicons.enable = true;
  };

  extraPlugins = with pkgs.vimPlugins; [haskell-tools-nvim];

  extraPackages = with pkgs; [
    # hsakell tools
    ghc
    haskellPackages.haskell-language-server
    haskellPackages.haskell-debug-adapter

    # dap and rust-tools
    lldb
  ];
}
