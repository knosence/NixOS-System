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
        emmet-language-server.enable = true;
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
          "<leader>D" = "open_float";
          "[d" = "goto_next";
          "]d" = "goto_prev";
        };
      };
    };
    plugins.rust-tools.enable = true;
  };
}
