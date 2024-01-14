{pkgs, ...}:
{

  imports = [
    ./_alpha.nix
    ./_auto-pairs.nix   
    ./_bufferline.nix
    ./_cmp.nix
    ./_comment.nix
    ./_git.nix
    ./_indent-blankline.nix
    #./_lightline.nix
    ./_lsp.nix
    ./_lualine.nix
    ./_noice.nix
    ./_none-ls.nix
    ./_nvim-tree.nix
    ./_options.nix
    ./_telescope.nix
    ./_toggleterm.nix
    ./_treesitter.nix
    ./_vimPlugins.nix 
    ./_wilder.nix
  ];

  
  home.packages = with pkgs;[
    vscode-extensions.astro-build.astro-vscode 

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
    colorschemes.catppuccin.enable = true;

    # Keymaps
    keymaps = [

      ## Neotree Keymaps
      {
        action = "<cmd>Neotree toggle right<CR>";
        key = "<leader>e";
        options.desc = "Open/Close Neotree";
      }
      {
        mode = "n";
        key = "<leader>c";
        action = "nil";
        options.desc = "Code";
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
        key = "<leader>t";
        action = "<CMD>ToggleTerm<CR>";
        options.desc = "Open/Close Terminal";
      }
      {
        mode = "n";
        key = "<leader>r";
        action = "nil";
        options.desc = "Rust Actions";
      }
     ];

    # Clopboards
    clipboard.providers = {
      wl-copy.enable = true;
      xclip.enable = true;
    };
    
    # Globals
    globals.mapleader = " ";
    
        
    
    # Plugins
    plugins = { 
      
      ## Whichkey
      which-key.enable = true;
      
      ## luaSnips
      luasnip.enable = true;

      ## oil
      oil.enable = true;

      ## Fidget
      fidget.enable = true;
      
      ts-autotag.enable = true;

      emmet.enable = true;
    
      nvim-colorizer.enable = true;


      };
    };
  }
