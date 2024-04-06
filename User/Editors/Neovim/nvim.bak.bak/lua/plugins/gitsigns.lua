return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",

  config = function()
    local icons = require "../config/icons"

    local wk = require "which-key"
    wk.register {
      ["]h"] = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Gitsigns Hunk" },
      ["[h"] = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Gitsigns Hunk" },
      ["<leader>gp"] = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "[G]it: [P]review Hunk" },
      ["<leader>gr"] = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "[G]it: [R]eset Hunk" },
      ["<leader>gl"] = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "[G]it: B[l]ame" },
      ["<leader>gR"] = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "[G]it: [R]eset Buffer" },
      ["<leader>gs"] = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "[G]it: [S]tage Hunk" },
      ["<leader>gu"] = {
        "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        "[G]it: [U]ndo Stage Hunk",
      },
      ["<leader>gd"] = {
        "<cmd>Gitsigns diffthis HEAD<cr>",
        "[G]it: [D]iff",
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
