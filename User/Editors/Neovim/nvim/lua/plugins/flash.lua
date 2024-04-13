return {
  "folke/flash.nvim",
  tag = "v1.18.2",
  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>"] = {
        l = {
          name = "flash",
          s = {
            function()
              require("flash").jump()
            end,
            "Flash Jump",
          },
          t = {
            function()
              require("flash").treesitter()
            end,
            "Flash Treesitter",
          },
          r = {
            function()
              require("flash").treesitter_search()
            end,
            "Flash Treesitter Search",
          },
        },
      },
    }
  end,
}
