{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>d";
        action = "nil";
        options.desc = "LSP Diagnostic";
      }
      {
        mode = "n";
        key = "<leader>g";
        action = "nil";
        options.desc = "LSP Goto";
      }
    ];

    plugins = {
      #   lsp-format = {
      #     enable = true;
      #     lspServerToEnable = "all";
      #   };

      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          clangd.enable = true;
          gopls.enable = true;
          nil_ls.enable = true;
          lua-ls = {
            enable = true;
            settings.telemetry.enable = false;
          };
          rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
          marksman.enable = true;
          # Frontend 
          html.enable = true;
          astro.enable = true;
          tailwindcss.enable = true;
          tsserver.enable = true;
          prismals.enable = true;
          dockerls.enable = true;
          cssls.enable = true;
          emmet_ls.enable = true;
          eslint.enable = true;
        };
        keymaps = {
          lspBuf = {
            "<leader>gd" = {
              action = "definition";
              desc = "Goto Definitions";
            };
            "<leader>gD" = {
              action = "references";
              desc = "Goto References";
            };
            "<leader>gt" = {
              action = "type_definition";
              desc = "Goto Type Definitions";
            };
            "<leader>gi" = {
              action = "implementation";
              desc = "Goto implementation";
            };
            "K" = "hover";
            "<leader>ca" = {
              action = "code_action";
              desc = "Code Actions";
            };
          };
          diagnostic = {
            "<leader>dd" = {
              action = "open_float";
              desc = "Open Diagnostic List";
            };
            "<leader>d[" = {
              action = "goto_next";
              desc = "Goto Next Issue";
            };
            "<leader>d]" = {
              action = "goto_prev";
              desc = "Goto Prev Issue";
            };
          };
        };
      };
      rust-tools.enable = true;
    };
  };

}
