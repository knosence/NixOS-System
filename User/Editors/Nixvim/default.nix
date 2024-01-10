{pkgs, ...}:

{


  imports = [
    ./_auto-pairs.nix   
    ./_options.nix
    ./_bufferline.nix
    ./_cmp.nix
    ./_git.nix
    ./_ionide.nix 
    ./_lightline.nix
    # ./_lualine.nix
    ./_none-ls.nix
    ./_nvim-tree.nix
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
      ## Telescope Keymaps
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fg";
      }
      {
        action = "<cmd>Telescope buffer<CR>";
        key = "<leader>fb";
      }
      {
        action = "<cmd>Telescope help_tags<CR>";
        key = "<leader>fh";
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
      
      ## telescope
      telescope.enable = true;

      ## Fidget
      fidget.enable = true;

      ## Gitgutter
      gitgutter.enable = true;

      ## Neo-tree
      neo-tree = {
        enable = true;
      };

      ## Treesitter
      treesitter.enable = true;
      
      ts-autotag.enable = true;

      emmet.enable = true;
    
      nvim-colorizer.enable = true;


      };
    };
  }
