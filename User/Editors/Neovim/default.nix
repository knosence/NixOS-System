{ pkgs, ... }:
let

  linuxPackages = with pkgs; [ neovide ];
in
{
  home.packages =
    with pkgs;
    [
      nodePackages_latest.typescript-language-server
      nodePackages_latest.bash-language-server
      nodePackages_latest.nodejs
      nodePackages."@prisma/language-server"
      nodePackages_latest.vercel
      nodePackages_latest.prisma
      nodePackages_latest.eslint
      nodePackages_latest.prettier
      nodePackages_latest.pnpm

      neovim-nightly
      neovim-remote
      vscode-extensions.prisma.prisma
      prisma-engines
      nil
      taplo
      yamlfmt
      # nixfmt-rfc-style
      neovide
      luajitPackages.luarocks-nix
      lua-language-server
      luajitPackages.jsregexp
      stylua
      gcc
      tailwindcss-language-server
      nixd
      eslint_d
      vscode-langservers-extracted
      tree-sitter
      prettierd
      nixfmt-rfc-style
      emmet-ls
      deno

      turso-cli
    ]
    ++ (linuxPackages);

  programs.neovim = {
    defaultEditor = true;
    withPython3 = true;
    package = pkgs.neovim-nightly;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      nvim-treesitter.withAllGrammars
      mason-nvim
    ];
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
