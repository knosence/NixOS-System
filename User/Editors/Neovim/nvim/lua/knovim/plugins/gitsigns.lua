return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",

  config = function()
    local icons = require "knovim.core.icons"

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

    require("gitsigns").setup {
      signs = {
        add = {
          hl = "GitSignsAdd",
          text = icons.ui.BoldLineMiddle,
          numhl = "GitSignsAddNr",
          linehl = "GitSignsAddLn",
        },
        change = {
          hl = "GitSignsChange",
          text = icons.ui.BoldLineDashedMiddle,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
        delete = {
          hl = "GitSignsDelete",
          text = icons.ui.TriangleShortArrowRight,
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        topdelete = {
          hl = "GitSignsDelete",
          text = icons.ui.TriangleShortArrowRight,
          numhl = "GitSignsDeleteNr",
          linehl = "GitSignsDeleteLn",
        },
        changedelete = {
          hl = "GitSignsChange",
          text = icons.ui.BoldLineMiddle,
          numhl = "GitSignsChangeNr",
          linehl = "GitSignsChangeLn",
        },
      },
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      update_debounce = 200,
      max_file_length = 40000,
      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    }
  end,
}
