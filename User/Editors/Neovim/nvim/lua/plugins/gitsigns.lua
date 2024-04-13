return {
  "lewis6991/gitsigns.nvim",
  event = "User FilePost",
  opts = function()
    return require "configs.gitsigns"
  end,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "git")
    require("gitsigns").setup(opts)
    local wk = require "which-key"
    wk.register {
      ["<leader>"] = {
        ["g"] = {
          name = "[G]it",
          ["g"] = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "[Git] [g]it Next Hunk" },
          ["G"] = {
            "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
            "[Git] [G]it Previous Hunk",
          },
          ["p"] = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "[Git] [P]review Hunk" },
          ["r"] = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "[Git] [R]eset Hunk" },
          ["l"] = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "[Git] B[l]ame" },
          ["R"] = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "[Git] [R]eset Buffer" },
          ["s"] = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "[Git] [S]tage Hunk" },
          ["u"] = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "[Git] [U]ndo Stage Hunk",
          },
          ["d"] = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "[Git] [D]iff",
          },
        },
      },
    }
  end,
}
