{
  plugins.none-ls = {
    enable = false;
    enableLspFormat = false;
    settings = {updateInInsert = false;};

    sources = {
      code_actions = {
        gitsigns.enable = true;
        statix.enable = true;
      };

      diagnostics = {
        statix.enable = true;
        checkstyle.enable = true;
      };

      formatting = {
        alejandra.enable = true;
        prettier = {
          enable = true;
          disableTsServerFormatter = false;
          withArgs = ''
            {
              extra_args = { "--no-semi", "--single-quote"},
            }
          '';
        };
        stylua.enable = true;
        black = {
          enable = true;
          withArgs = ''
            {
              extra_args = { "--fast" },
            }
          '';
        };
        clang_format.enable = true;
      };
    };
  };
}
