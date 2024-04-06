{ pkgs, ... }:
let

  linuxPackages = with pkgs; [ neovide ];

in {
  home.packages = with pkgs;
    [
      neovim-nightly
      neovim-remote
      nodePackages_latest.prisma
      vscode-extensions.prisma.prisma
      prisma-engines
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
      nodePackages_latest.nodejs
      nodePackages."@prisma/language-server"
      eslint_d
      vscode-langservers-extracted
      nodePackages_latest.eslint
      tree-sitter
      prettierd
      nodePackages_latest.prettier
      nixfmt
      emmet-ls
    ] ++ (linuxPackages);

  programs.neovim = {
    defaultEditor = true;
    withPython3 = true;
    package = pkgs.neovim-nightly;
    plugins = with pkgs.vimPlugins; [ nvim-treesitter.withAllGrammars ];
  };

  home.file."./.config/nvim/" = {
    source = ./nvim;
    recursive = true;
  };

  # home.sessionVariables = {
  #   LIBLLDB_PATH = "${lldbAdapter}/lib/libcodelldb.so";
  #   CODELLDB_PATH = "${lldbAdapter}/bin/codelldb";
  # };
}
