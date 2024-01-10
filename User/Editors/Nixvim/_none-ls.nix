{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources = {
      diagnostics = {
        golangci_lint.enable = true;
        shellcheck.enable = true;
        statix.enable = true;
      };
      formatting = {
        fantomas.enable = true;
        gofmt.enable = true;
        goimports.enable = true;
        nixfmt.enable = true;
        markdownlint.enable = true;
        rustfmt.enable = true;
      };
    };
  };
}
