{
  keymaps = [
    {
      mode = "n";
      key = "<C-Bslash>";
      action = ":split<CR>";
    }
    {
      mode = "n";
      key = "<C-/>";
      action = ":vsplit<CR>";
    }
    {
      mode = "n";
      key = "<BS>";
      action = ":noh<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<C-H>";
      action = "<C-W><C-H>";
    }
    {
      mode = "n";
      key = "<C-J>";
      action = "<C-W><C-J>";
    }
    {
      mode = "n";
      key = "<C-K>";
      action = "<C-W><C-K>";
    }
    {
      mode = "n";
      key = "<C-L>";
      action = "<C-W><C-L>";
    }
  ];
}
