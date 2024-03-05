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
        tsserver.enable = true;
        dockerls.enable = true;
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
