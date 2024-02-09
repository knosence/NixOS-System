{
    programs.nixvim.options = {
      updatetime = 100;

      number = true;
      relativenumber = true;
      shiftwidth = 2;
      autoindent = true;
      smartindent = true;
      tabstop = 2;
      expandtab = true;
      
    clipboard = {
      register = "unnamedplus";
      providers = {
        wl-copy.enable = true;
        xclip.enable = true;
      };
    };
      termguicolors = true;
      cursorline = true;

      mouse = "a";

      smartcase = true;
      ttimeoutlen = 5;
      compatible = false;
      autoread = true;
      incsearch = true;
      ignorecase = true;
      hidden = true;
      shortmess = "atI";
      
      wildmode = "list:longest";
    };
}
