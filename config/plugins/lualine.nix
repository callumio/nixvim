{
  plugins.lualine = {
    enable = true;
    settings = {
      componentSeparators = {
        left = "|";
        right = "|";
      };

      sectionSeparators = {
        left = "";
        right = "";
      };

      sections = {lualine_a = [{name = "buffers";}];};
    };
  };
}
