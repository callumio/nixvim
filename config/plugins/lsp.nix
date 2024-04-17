{
  plugins = {
    lsp-format.enable = true;
    lsp = {
      enable = true;

      servers = {
        rnix-lsp.enable = true;
        lua-ls.enable = true;
        clangd.enable = true;
        pyright.enable = true;
        tsserver = {
          enable = true;
          filetypes =
            [ "javascript" "javascriptreact" "typescript" "typescriptreact" ];
          extraOptions.typescript.inlayHints = {
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
        dockerls.enable = true;
        marksman.enable = true;
      };

      onAttach = ''
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(bufnr, true)
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
