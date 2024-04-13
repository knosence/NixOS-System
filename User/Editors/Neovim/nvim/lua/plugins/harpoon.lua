return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },

  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>cm"] = {
        function()
          require("harpoon.mark").add_file()
          vim.notify "󱡅  marked file"
        end,
        "[Code] Harpoon [M]ark File",
      },
      ["<leader>H"] = {
        "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
        "Harpoon Menu",
      },
    }
  end,
}
