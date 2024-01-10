{pkgs, ...}:

{


  imports = [
    ./_auto-pairs.nix   
    ./_bufferline.nix
    ./_cmp.nix
    ./_git.nix
    ./_ionide.nix 
    ./_lightline.nix
    ./_lsp.nix
    # ./_lualine.nix
    ./_none-ls.nix
    ./_nvim-tree.nix
    ./_options.nix
    ./_telescope.nix
    ./_toggleterm.nix
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

      ## Gitgutter
      gitgutter.enable = true;


      ## Treesitter
      treesitter.enable = true;
      
      ts-autotag.enable = true;

      emmet.enable = true;
    
      nvim-colorizer.enable = true;


      };
    };
  }
