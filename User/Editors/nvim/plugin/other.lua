-- Lualine
require("lualine").setup({
    icons_enabled = true,
    theme = 'catppuccin',
})

-- Colorscheme
vim.cmd("colorscheme catppuccin")

-- Comment
require("Comment").setup()
