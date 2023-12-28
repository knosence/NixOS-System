{ config, pkgs, nixpkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "knosence";
  home.homeDirectory = "/home/knosence";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    ./../../User/App/kitty/kitty.nix
    

  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.

  nixpkgs.config = {

    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };


  home.packages = with pkgs;[
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    hello
    zsh
    brave
    obsidian
    zellij
    lazygit
    fd
    ripgrep
    nerdfonts
    kitty

    # Utils
    unzip
    tree
    lf

    # Developement
    # zig # For C compiler
    clang_17
    nodejs_21
    nodePackages_latest.nodejs
    tree-sitter
    nil
    lua
    lua-language-server
    lua52Packages.luarocks-nix


    # Rust
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy



    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';"
    #".config/nvim/lua".source = ./../../User/Editors/nvim/lua;
    #".config/nvim/init.lua".source = ./../../User/Editors/nvim/init.lua;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/knosence/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      ".." = "cd ..";
    };

    programs.neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      xdg.configFile.nvim.source = ../../User/Editors/nvim;

    }
  };



   
}
