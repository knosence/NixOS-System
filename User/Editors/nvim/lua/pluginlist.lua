return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },
  {
    "catppuccin/catpuccin",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catpuccin")
    end
  },
}
