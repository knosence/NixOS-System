{ pkgs, ... }: {

  imports = [
    ./_alpha.nix
    ./_auto-pairs.nix
    ./_bufferline.nix
    ./_cmp.nix
    ./_comment.nix
    ./_fidget.nix
    ./_git.nix
    ./_indent-blankline.nix
    #./_lightline.nix
    ./_lint.nix
    ./_lsp.nix
    ./_lualine.nix
    ./_multicursors.nix
    ./_neo-tree.nix
    ./_noice.nix
    ./_none-ls.nix
    ./_nvim-tree.nix
    ./_options.nix
    ./_startify.nix
    ./_telescope.nix
    ./_toggleterm.nix
    ./_treesitter.nix
    ./_vimPlugins.nix
    ./_which-key.nix
    ./_wilder.nix
  ];

  home.packages = with pkgs; [
    vscode-extensions.astro-build.astro-vscode
    vscode-langservers-extracted
    emmet-language-server

    # Developement
    # zig # For C compiler
    clang_17
    nodejs_21
    nodePackages_latest.nodejs
    nodePackages_latest.eslint_d
    nodePackages_latest.jsonlint
    selene
    checkstyle
    tree-sitter
    nil
    lua
    lua-language-server
    lua52Packages.luarocks-nix
    # To get Drizzle ORM studio to work in Brave Browser
    nss
    mkcert

    flyctl

    # Rust
    rustup
  ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    viAlias = true;

    # Colorscheme
    colorschemes.catppuccin = {
      enable = true;
      flavour = "macchiato";
      showBufferEnd = true;
      # transparentBackground = true;
      integrations = {
        mini.enabled = true;

      };
    };

    # Keymaps
    keymaps = [

      ## Neotree Keymaps
      {
        action = "<cmd>Neotree toggle float<CR>";
        key = "<leader>E";
        options.desc = "Open/Close Neotree";
      }
      {
        action = "<cmd>NvimTreeToggle<CR>";
        key = "<leader>e";
        options.desc = "Open/Close Nvim-Tree";
      }
      {
        key = "<leader>cf";
        action = "<CMD>lua vim.lsp.buf.format()<CR>";
        options.desc = "Code Format";
      }
      {
        mode = "n";
        key = "<leader>rs";
        action = "<CMD>RustStartStandaloneServerForBuffer<CR>";
        options.desc = "Rust Start Standalone Server For Buffer";
      }
      {
        mode = "n";
        key = "<a-t>";
        action = "<CMD>ToggleTerm<CR>";
        options.desc = "Open/Close Terminal";
      }
      {
        mode = "n";
        key = "<leader>tg";
        action = "<CMD>LazyGit<CR>";
      }
      # {
      #   mode = "n";
      #   key = "<leader>t";
      #   action = "nil";
      #   options.desc = "Toggle";
      # }
    ];

    # Globals
    globals.mapleader = " ";

    # Plugins
    plugins = {

      ## luaSnips
      luasnip.enable = true;

      ## oil
      # oil.enable = true;

      ts-autotag.enable = true;

      emmet.enable = true;

      nvim-colorizer.enable = true;

      # nvim-lightbulb = {
      # enable = true;
      # float = { enabled = true; };
      # };

      vim-matchup = {
        enable = true;

        #delete (ds%)
        #change (cs%)
        enableSurround = true;
      };

      project-nvim.enable = true;

      rainbow-delimiters.enable = true;

      fugitive.enable = true;

      # obsidian = {
      #   enable = true;
      #   ui.enable = true;
      #   ui.updateDebounce = 500;
      # };

      lspsaga = {
        enable = true;
        lightbulb = {
          enable = false;
          # sign = true;
          # signPriority = 60;
          # debounce = 50;
        };
      };

    };
  };
}
