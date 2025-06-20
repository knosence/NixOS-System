{
  config,
  pkgs,
  nixpkgs,
  inputs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "knosence";
    homeDirectory = "/home/knosence";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = [
    # inputs.nixvim.homeManagerModules.nixvim

    ./../../User/App/kitty/kitty.nix
    ./../../User/Editors/Neovim
    ./../../User/App/yazi
    ./../../User/Shells/zsh.nix
  ];

  services.emacs = {
    enable = true;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.

  # xdg.configFile.nvim.source = ../../User/Editors/Neovim;

  nixpkgs = {
    overlays = [ inputs.neovim-nightly-overlay.overlay ];
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [ "nix-2.16.2" ];
    };
  };

  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    brave
    telegram-desktop
    obsidian
    # electron_28
    nerdfonts
    kitty
    onlyoffice-bin
    spotify
    gimp
    zoom-us
    discord
    blender
    bottom
    vlc
    plasma-applet-caffeine-plus
    caffeine-ng
    vscode
    emacs
    sxiv
    mpv
    # neovide
    # https://github.com/ollama/ollama/blob/main/docs/linux.md
    # (ollama.override { acceleration = "rocm"; })

    ## CLI
    yazi

    ## Development Pkgs
    nodePackages_latest.jshint
    markdownlint-cli
    sqlint
    yamlfmt
    yamllint
    nodePackages_latest.csslint
    virt-manager-qt

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

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
    zsh.enable = true;
    vscode.enable = true;
  };

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
    # ".config/nvim/lua".source = ./../../User/Editors/Nvim/lua;
    # ".config/nvim/init.lua".source = ./../../User/Editors/Nvim/init.lua;
    ".config/zellij/Layouts".source = ./../../User/App/zellij/Layouts;
    ".config/zellij/config.kdl".source = ./../../User/App/zellij/config.kdl;
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
}
