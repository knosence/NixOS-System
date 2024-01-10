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
        fsautocomplete.enable = true;
        gopls.enable = true;
        nil_ls.enable = true;
        lua-ls.enable = {
          enable = true;
          settings.telemetry.enable = false;
        };
        rust-analyzer.enable = true;
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
        };
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };
      };
    };
    plugins.rust-tools.enable = true;
  };
}
