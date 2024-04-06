local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>cm"] = { "<cmd>lua require('plugins.harpoon').mark_file()<cr>", "[C]ode: Harpoon [M]ark File" },
    ["<leader>H"] = {
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      "Harpoon Menu",
    },
  }
end

function M.mark_file()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  marked file"
end

return M
