{
  programs.nixvim.plugins.comment-nvim = {
    enable = true;
    toggler = {
      line = {
        action = "cc";
        desc = "Comments Current Line";
      };
      block = {
        action = "cb";
        desc = "Comments Block";
      };
    };
  };
} 
