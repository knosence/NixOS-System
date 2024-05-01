return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.catppuccin_flavour = "macchiato"
    require("catppuccin").setup {
      flavour = "latte",
      dim_inactive = {
        enabled = false,
      },
      integrations = {
        cmp = true,
        nvimtree = true,
        treesitter = true,
      },
    }

    vim.cmd.colorscheme "catppuccin-macchiato"
  end,
}
