{
  config,
  lib,
  pkgs,
  ...
}: {
  extraPackages = map (let
    mapping = with pkgs; {
      clang-format = libclang;
      inherit (nodePackages) prettier;
    };
  in
    pkg:
      if lib.hasAttr pkg mapping
      then mapping.${pkg}
      else pkgs.${pkg})
  (lib.flatten (lib.attrValues config.plugins.conform-nvim.settings.formatters_by_ft));

  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = true;
      formatters_by_ft = {
        html = [["prettierd" "prettier"]];
        css = [["prettierd" "prettier"]];
        javascript = [["prettierd" "prettier"]];
        javascriptreact = [["prettierd" "prettier"]];
        typescript = [["prettierd" "prettier"]];
        typescriptreact = [["prettierd" "prettier"]];
        python = ["black"];
        lua = ["stylua"];
        nix = ["alejandra"];
        markdown = [["prettierd" "prettier"]];
        rust = ["rustfmt"];
        c = ["clang-format"];
      };
    };
  };
  extraConfigLua = ''
    local conform = require("conform")
    conform.setup({
      format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    })

    vim.api.nvim_create_user_command("FormatToggle", function(args)
      local is_global = not args.bang
      if is_global then
        vim.g.disable_autoformat = not vim.g.disable_autoformat
      else
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      end
    end, {
      desc = "Toggle autoformat-on-save",
      bang = true,
    })
  '';
}
