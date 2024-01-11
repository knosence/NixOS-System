{
  programs.nixvim.plugins = {
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
        # Frontend 
        html.enable = true;
        astro.enable = true;
        tailwindcss.enable = true;
        tsserver.enable = true;
        emmet_ls.enable = true;
        eslint.enable = true;
      };
      keymaps = {
        lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "K" = "hover";
          "<leader>ca" = "code_action";
        };
        diagnostic = {
          "<leader>D" = "open_float";
          "[d" = "goto_next";
          "]d" = "goto_prev";
        };
      };
    };
    rust-tools.enable = true;
  };
}
