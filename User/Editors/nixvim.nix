{
  programs.nixvim = {
    enable = true;
    
    # Keymaps
    keymaps = [
      {
        action = "<cmd>Neotree toggle right<CR>";
	key = "<leader>e";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
	key = "<leader>ff";
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
    };
    
    # Colorscheme
    colorschemes.catppuccin.enable = true;
    
    # Plugins
    plugins = { 
      
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
      
      ## BufferLine
      bufferline.enable = true;

      ## Lualine
      lualine.enable = true;
      
      ## Lsp Format
      lsp-format = {
	enable = true;
	lspServersToEnable = "all";
      };

      ## LSP
      lsp = {
	enable = true;

	### Servers
	servers = {
	  #### JavaScript, TypeScript
	  tsserver.enable = true;
	  
	  #### Lua
	  lua-ls = {
	    enable = true;
	    settings.telemetry.enable = false;
	  };

	  rust-analyzer = {
	    enable = true;
	    installCargo = true;
	    installRustc = true;
	  };

	  #### Nix
	  nil_ls = {
	    enable = true;
	  };
	};
      };
      
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
