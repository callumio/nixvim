{
  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    updateInInsert = true;

    sources = {
      code_actions = { statix.enable = true; };

      diagnostics = {
        statix.enable = true;
        selene = {
          enable = true;
          withArgs = ''
            {
              cwd = function(_params)
                return vim.fs.dirname(
                  vim.fs.find({ "selene.toml" }, { upward = true, path = vim.api.nvim_buf_get_name(0) })[1]
                ) or vim.fn.expand("~/.config") -- fallback value
              end,
            }
          '';
        };
      };

      formatting = {
        stylua.enable = true;
        clang_format.enable = true;
        shfmt.enable = true;
        nixfmt.enable = true;
      };
    };
  };
}
