{
  programs.nixvim.plugins.comment-nvim = {
    enable = true;
    toggler = {
      line = "<leader>cc"; 
      block = "<leader>cb";  
    };
  };
} 
