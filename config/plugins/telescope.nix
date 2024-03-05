{
  plugins.telescope = {
    enable = true;

    keymapsSilent = true;
    keymaps = {
      "<S-Tab>" = "find_files";
      "<leader>fg" = "live_grep";
      "<Tab>" = "buffers";
      "<leader>fh" = "help_tags";
    };

    extensions = {
      fzf-native = {
        overrideGenericSorter = true;
        overrideFileSorter = true;
        caseMode = "smart_case";
      };
    };
  };
}
