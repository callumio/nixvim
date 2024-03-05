{ config, pkgs, ... }: {
  config = {
    colorschemes = {
      onedark = {
        enable = true;
        package = pkgs.vimPlugins.onedark-nvim;
      };
    };

    clipboard.register = "unnamedplus";
    clipboard.providers.wl-copy.enable = true;

    viAlias = true;
    vimAlias = true;

    options = {
      mouse = "n";

      termguicolors = true;

      number = true;
      relativenumber = true;

      signcolumn = "yes";

      tabstop = 2;
      shiftwidth = 2;
      smartindent = true;

      updatetime = 100;

      splitbelow = true;
      splitright = true;

      swapfile = false;
      backup = false;
      undofile = true;
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
  };
}
