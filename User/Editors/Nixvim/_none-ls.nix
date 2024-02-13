{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources = {
      code_actions = {
        eslint.enable = true;
        eslint_d.enable = true;
        gitsigns.enable = true;
        shellcheck.enable = true;
        statix.enable = true;
      };
      diagnostics = {
        eslint.enable = true;
        eslint_d.enable = true;
        gitlint.enable = true;
        shellcheck.enable = true;
        statix.enable = true;
        luacheck.enable = true;
        yamllint.enable = true;
      };
      formatting = {
        nixfmt.enable = true;
        markdownlint.enable = true;
        rustfmt.enable = true;
        eslint.enable = true;
        eslint_d.enable = true;
        /* prettier = {
          disableTsServerFormatter = true;
          enable = true;
        }; */
        # prettierd.enable = true;

      };
    };
  };
}
