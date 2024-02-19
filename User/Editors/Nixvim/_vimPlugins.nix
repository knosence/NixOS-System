{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      Ionide-vim
      vim-astro
      dressing-nvim

      # for neo-tree
      nui-nvim
      nvim-web-devicons
      plenary-nvim

      lazygit-nvim
    ];
  };

}
