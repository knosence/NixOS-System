return {
  "2kabhishek/nerdy.nvim",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Nerdy",

  keys = {
    { mode = { "n" }, "<leader>fn", "<cmd>Nerdy<CR>", desc = "Nerdy - Search Nerd Icons" },
  },
}
