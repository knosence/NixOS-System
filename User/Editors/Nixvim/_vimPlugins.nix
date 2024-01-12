{pkgs, ...}:

{
  programs.nixvim = {
    extraPlugins = with  pkgs.vimPlugins; [
      Ionide-vim
      vim-astro
      dressing-nvim
    ];
  };

}
