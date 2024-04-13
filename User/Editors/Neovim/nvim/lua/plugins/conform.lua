return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      toml = { "taplo" },
      yaml = { "yamlfmt" },
      lua = { "stylua" },
      sh = { "shfmt" },
      nix = { "nixfmt" },
      typescript = { { "prettierd", "prettier" } },
      typescriptreact = { { "prettierd", "prettier" } },
      javascript = { { "prettierd", "prettier" } },
      javascriptreact = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      rust = { "rustfmt" },
    },
  },
}
