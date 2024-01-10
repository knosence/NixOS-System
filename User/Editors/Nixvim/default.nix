{pkgs, ...}:

{


  imports = [
    ./_auto-pairs.nix   
    ./_options.nix
    ./_bufferline.nix
    ./_cmp.nix
    ./_git.nix
    
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

      ## none-ls
      none-ls.enable = true;

      ## Neo-tree
      neo-tree = {
        enable = true;
      };

      ## Treesitter
      treesitter.enable = true;
      
      ts-autotag.enable = true;

      ## Lualine
      lualine.enable = true;

      emmet.enable = true;
    
      nvim-colorizer.enable = true;

      ## Lsp Format
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };

      ## Plagign>>LSP
      lsp = {
        enable = true;

        keymaps = {
          lspBuf = {
            K = "hover";
            gD = "references";
            gd = "definition";
            gi = "implementation";
            gt = "type_definition";
          };
          diagnostic = {
            "<leader>j" = "goto_next";
            "<leader>k" = "goto_prev";
          };
        };

        ### Servers
        servers = {
          #### JavaScript, TypeScript
          tsserver.enable = true;
	    
          #### Lua
          lua-ls = {
            enable = true;
            settings.telemetry.enable = false;
          };

          #### Rust
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };

          astro = {
            enable = true;
          };

          tailwindcss.enable = true;

          eslint.enable = true;

          emmet_ls = {
            enable = true;
          };

          html.enable = true;

          #### Nix
          nil_ls = {
            enable = true;
          };
        };
      };

      };
    };
  }
