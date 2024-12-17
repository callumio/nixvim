{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        componentSeparators = {
          left = "|";
          right = "|";
        };

        sectionSeparators = {
          left = "";
          right = "";
        };
      };

      #sections = {lualine_a = [{name = "buffers";}];};
      sections = {lualine_a = [{}];};
    };
  };
}
