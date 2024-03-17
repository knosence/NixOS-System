{ pkgs, inputs, ... }: 

let
  
  lldbAdapter = pkgs.vscode-extensions.vadimcn.vscode-lldb.adapter;

  linuxPackages = with pkgs; [
    neovide
  ];

in {
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