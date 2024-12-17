{
  plugins = {
    #lsp-format.enable = true;
    lsp = {
      enable = true;
      servers = {
        nil_ls = {
          enable = true;
          settings.nix = {
            maxMemoryMB = null;
            flake = {
              autoEvalInputs = true;
              autoArchive = true;
            };
          };
        };

        lua_ls.enable = true;
        clangd.enable = true;
        pyright.enable = true;
        ts_ls = {
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
        ruff.enable = true;
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
