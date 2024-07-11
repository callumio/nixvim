{
  plugins.lualine = {
    enable = true;
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
}
