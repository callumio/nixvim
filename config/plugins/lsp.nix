{
  plugins = {
    #lsp-format.enable = true;
    lsp = {
      enable = true;
      servers = {
        nil-ls.enable = true;
        lua-ls.enable = true;
        clangd.enable = true;
        pyright.enable = true;
        tsserver = {
          enable = true;
          filetypes = ["javascript" "javascriptreact" "typescript" "typescriptreact"];
          extraOptions.settings = {
            javascript.inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
              includeInlayVariableTypeHintsWhenTypeMatchesName = true;
            };
            typescript.inlayHints = {
              includeInlayEnumMemberValueHints = true;
              includeInlayFunctionLikeReturnTypeHints = true;
              includeInlayFunctionParameterTypeHints = true;
              includeInlayParameterNameHints = "all";
              includeInlayParameterNameHintsWhenArgumentMatchesName = true;
              includeInlayPropertyDeclarationTypeHints = true;
              includeInlayVariableTypeHints = true;
              includeInlayVariableTypeHintsWhenTypeMatchesName = true;
            };
          };
        };
        eslint.enable = true;
        ruff-lsp.enable = true;
        dockerls.enable = true;
        marksman.enable = true;
        gleam.enable = true;
      };

      onAttach = ''
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(true)
        end
      '';

      keymaps = {
        silent = true;

        diagnostic = {
          "[d" = "goto_next";
          "]d" = "goto_prev";
        };

        lspBuf = {
          "K" = "hover";
          "gd" = "definition";
          "gD" = "declaration";
          "gr" = "references";
          "vrn" = "rename";
          "vca" = "code_action";
          "<C-h>" = "signature_help";
        };
      };
    };
  };
}
