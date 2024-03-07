{
  plugins.neocord = {
    enable = true;
    settings = {
      enable_line_number = true;
      line_number_text = "Line %s of %s";
      buttons = [
        {
          label = "Vim Config";
          url = "https://github.com/callumio/nixvim";
        }
        {
          label = "Nix Config";
          url = "https://github.com/callumio/dots";
        }
        {
          label = "Github";
          url = "https://github.com/callumio";
        }
      ];
    };
  };
}
