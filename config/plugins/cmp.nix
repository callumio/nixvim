{
  plugins = {
    cmp-nvim-lsp.enable = true;
    cmp_luasnip.enable = true;
    luasnip.enable = true;
    friendly-snippets.enable = true;

    nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      sources =
        [{ name = "nvim_lsp"; } { name = "path"; } { name = "luasnip"; }];
      mapping = {
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<C-Space>" = "cmp.mapping.complete({})";
        "<Tab>" = {
          action = ''
            function(fallback)
              local luasnip = require('luasnip')
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expandable() then
                luasnip.expand()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end
          '';
          modes = [ "i" "s" ];
        };
        "<S-Tab>" = {
          action = ''
            function (fallback)
              local luasnip = require('luasnip')
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end
          '';
        };
      };
    };
  };
}
