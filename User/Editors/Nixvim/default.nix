{

  imports = [
    ./_auto-pairs.nix   
    ./_bufferline.nix
    ./_cmp.nix
    ./_git.nix
    ./_indent-blankline.nix
    ./_vimPlugins.nix 
    #./_lightline.nix
    ./_lsp.nix
    ./_lualine.nix
    ./_none-ls.nix
    ./_nvim-tree.nix
    ./_options.nix
    ./_telescope.nix
    ./_toggleterm.nix
    ./_treesitter.nix
    ./_wilder.nix
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
      }
      {
        key = "<leader>fm";
        action = "<CMD>lua vim.lsp.buf.format()<CR>";
      }
      {
        mode = "n";
        key = "<leader>rs";
        action = "<CMD>RustStartStandaloneServerForBuffer<CR>";
      }
      {
        mode = "n";
        key = "<leader>t";
        action = "<CMD>ToggleTerm<CR>";
      }
      {
        mode = "t";
        key = "<ESC>";
        action = "<CMD>ToggleTerm<CR>";
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
