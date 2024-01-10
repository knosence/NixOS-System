{pkgs, ...}:

{

  imports = [
    
  ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    

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
    
    # Options
    options = {
      number = true;
      relativenumber = true;

      shiftwidth = 2;
      autoindent = true;
      smartindent = true;
      tabstop = 2;
      expandtab = true;
      
      termguicolors = true;
      cursorline = true;

      mouse = "a";

      smartcase = true;
      ttimeoutlen = 5;
      compatible = false;
      autoread = true;
      incsearch = true;
      hidden = true;
      shortmess = "atI";
    };
    
    # Colorscheme
    colorschemes.catppuccin.enable = true;
    
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

      nvim-autopairs.enable = true;

      ## BufferLine
      bufferline.enable = true;

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

      ## Compy
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
          {name = "luasnip";}
        ];

        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = {
            action = ''
        function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end
            '';
            modes = [ "i" "s" ];
          };
        };
      };
      };
    };
  }
