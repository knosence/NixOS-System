# yt-dlp -o "%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" "https://www.youtube.com/playlist?list=PLK5U0tyd34tBYZ1L6rplNfFNNQPwgCRR0"

{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    # initExtra = ''
    #   export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')
    # '';
    shellAliases = import ./aliases.nix;

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.6.3";
          sha256 = "1h8h2mz9wpjpymgl2p7pc146c1jgb3dggpvzwm9ln3in336wl95c";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "be3882aeb054d01f6667facc31522e82f00b5e94";
          sha256 = "0w8x5ilpwx90s2s2y56vbzq92ircmrf0l5x8hz4g1nx3qzawv6af";
        };
      }
      {
        name = "zsh-autocomplete";
        src = pkgs.fetchFromGitHub {
          owner = "marlonrichert";
          repo = "zsh-autocomplete";
          rev = "c7b65508fd3a016dc9cdb410af9ee7806b3f9be1";
          sha256 = "1c8hvclwdf3xcz8fxj9kvdahxq3mq40ipqcvf1hnaj2ffs86fq5v";
        };
      }
      {
        name = "fast-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zdharma-continuum";
          repo = "fast-syntax-highlighting";
          rev = "cf318e06a9b7c9f2219d78f41b46fa6e06011fd9";
          sha256 = "1bmrb724vphw7y2gwn63rfssz3i8lp75ndjvlk5ns1g35ijzsma5";
        };
      }
    ];

    sessionVariables = rec {
      NVIM_TUI_ENABLE_TRUE_COLOR = "1";

      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE = "fg=3";
      DEV_ALLOW_ITERM2_INTEGRATION = "1";

      EDITOR = "vim";
      VISUAL = EDITOR;
      GIT_EDITOR = EDITOR;
    };

    oh-my-zsh = {
      enable = true;
      theme = "refined";
    };
    # envExtra
    # profileExtra
    # loginExtra
    # logoutExtra
    # localVariables
  };

  home.packages = with pkgs; [
    bat
    colorls
    ripgrep
    fd
    fzf
    gh
    unzip
    htop
    zellij
    lazygit
    tree
    yt-dlp
    lf
    xclip
    ffmpegthumbnailer
    bun
    poppler # for PDF preview
    unar
    zoxide # for historical directories navigation
    jq # for Json preview
    cmake
    libtool
    zsh
    wl-clipboard

    mkcert
    nss_latest

    openssl
    btop
    zoxide
    starship
    zinit
    ollama
  ];
}
