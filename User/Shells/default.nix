{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    shellAliases = {
      ls = "ls --color";
      vim = "nvim";
      c = "clear";
    };
    options = {
      HISTSIZE = 5000;
      SAVEHIST = 5000;
      HISTFILE = "~/.zsh_history";
      HISTDUP = "erase";
      setopt = {
        appendhistory = true;
        sharehistory = true;
        hist_ignore_space = true;
        hist_ignore_all_dups = true;
        hist_save_no_dups = true;
        hist_ignore_dups = true;
        hist_find_no_dups = true;
      };
    };
    plugins = [
      # Add your plugins here, including Powerlevel10k and others
    ];
    sessionVariables = {
      # Add your environment variables here

    };
  };

  home.packages = with pkgs; [
    # List your packages here
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
    openssl
    btop
    zoxide
    starship
    zinit
  ];

  # Additional configurations like installing Zinit and setting up Powerlevel10k
  programs.zsh.initExtra = ''
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
    # Initialization code goes here
    # Add in Powerlevel10k
    zinit ice depth=1; zinit light romkatv/powerlevel10k

    # Add in zsh plugins
    zinit light zsh-users/zsh-syntax-highlighting
    zinit light zsh-users/zsh-completions
    zinit light zsh-users/zsh-autosuggestions
    zinit light Aloxaf/fzf-tab

    # Add in snippets
    zinit snippet OMZP::git
    zinit snippet OMZP::sudo
    zinit snippet OMZP::archlinux
    zinit snippet OMZP::aws
    zinit snippet OMZP::kubectl
    zinit snippet OMZP::kubectx
    zinit snippet OMZP::command-not-found

    # Load completions
    autoload -Uz compinit && compinit

    # Completion styling
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    zstyle ':completion:*' list-colors "${("s.:.") LS_COLORS}"
    zstyle ':completion:*' menu no
    zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
    zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

    # Shell integrations
    eval "$(fzf --zsh)"
    eval "$(zoxide init --cmd cd zsh)"
  '';

  /*
    # Install Zinit manually if not available in Nix
    programs.zsh.extraInit = ''
      if [! -d "$HOME/.local/share/zinit/zinit.git" ]; then
        mkdir -p "$HOME/.local/share/zinit"
        git clone https://github.com/zdharma-continuum/zinit.git "$HOME/.local/share/zinit/zinit.git"
      fi
      source "$HOME/.local/share/zinit/zinit.zsh"
    '';
  */
}
