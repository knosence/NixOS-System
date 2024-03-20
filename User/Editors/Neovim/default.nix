{ pkgs, inputs, ... }: 

{
  nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlay ];
  home.packages = with pkgs; [
    neovim-remote
    nil
    taplo
    yamlfmt
    nixfmt
    neovide
    luajitPackages.luarocks-nix
    lua-language-server
    luajitPackages.jsregexp
    stylua
    gcc
    tailwindcss-language-server 
    nixd
    nodePackages_latest.typescript-language-server
    # vimPlugins.mason-lspconfig-nvim
    # vimPlugins.mason-nvim
    vimPlugins.mason-tool-installer-nvim
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.neovim-nightly;
  };

  
  home.file."./.config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };
}
