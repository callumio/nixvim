{
  plugins = {
    cmp-nvim-lsp.enable = true;
    cmp_luasnip.enable = true;
    luasnip.enable = true;
    friendly-snippets.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-Space>" = "cmp.mapping.complete({})";
        };
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
      };
    };
  };
}
