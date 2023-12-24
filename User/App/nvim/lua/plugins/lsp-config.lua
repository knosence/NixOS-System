return {
  {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end 
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"astro","lua_ls", "tsserver"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
    })
      vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, {})
    end 
  }
}
