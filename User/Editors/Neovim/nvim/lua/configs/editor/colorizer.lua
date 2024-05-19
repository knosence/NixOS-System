return {
  "norcalli/nvim-colorizer.lua",
  require("colorizer").setup {
    filetypes = {
      "html",
      "css",
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
      "lua",
    },
    user_default_options = {
      mode = "background",
      tailwind = true, -- Enable tailwind colors
    },
  },
}
