{
  config = {
    plugins.rustaceanvim = {
      enable = true;
      server.onAttach = ''
        function(client, bufnr)
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(bufnr, true)
          end
        end
      '';
      extraOptions = { inlay_hints = { highlight = "Comment"; }; };
    };
  };
}
