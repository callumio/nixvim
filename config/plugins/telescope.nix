{
  plugins.telescope = {
    enable = true;

    keymaps = {
      "<S-Tab>" = "find_files";
      "<leader>fg" = "live_grep";
      "<Tab>" = "buffers";
      "<leader>fh" = "help_tags";
    };

    extensions = {
      fzf-native = {
        settings = {
          override_generic_sorter = true;
          override_file_sorter = true;
          case_mode = "smart_case";
        };
      };
    };
  };
}
