local theme = require("base46").get_theme_tb "base_30"

return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- quick launch
    {
      "]t",
      function()
        require("todo-comments").jump_next()
      end,
      mode = "n",
      desc = "Todo Comments Next",
    },
    {
      "[t",
      function()
        require("todo-comments").jump_prev()
      end,
      mode = "n",
      desc = "Todo Comments Prev",
    },

    { "<leader>fd", "<cmd>TodoTelescope<cr>", desc = "Todo Comments - Search" },
    {
      "<leader>ct",
      function()
        require("todo-comments").jump_next()
      end,
      mode = "n",
      desc = "Todo Comments Next -> ]t",
    },
    {
      "<leader>cT",
      function()
        require("todo-comments").jump_prev()
      end,
      mode = "n",
      desc = "Todo Comments Prev -> [t",
    },
  },
  opts = {
    signs = true, -- show icons in the signs column
    sign_priority = 8, -- sign priority
    -- keywords recognized as todo comments
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "󰤑 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },

    gui_style = {
      fg = "NONE", -- The gui style to use for the fg highlight group.
      bg = "BOLD", -- The gui style to use for the bg highlight group.
    },
    merge_keywords = true, -- when true, custom keywords will be merged with the defaults
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
      multiline = true, -- enable multine todo comments
      multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
      multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
      before = "", -- "fg" or "bg" or empty
      keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
      after = "fg", -- "fg" or "bg" or empty
      pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
      comments_only = true, -- uses treesitter to match keywords in comments only
      max_line_len = 400, -- ignore lines longer than this
      exclude = {}, -- list of file types to exclude highlighting
    },
    -- list of named colors where we try to extract the guifg from the
    -- list of highlight groups or use the hex color if hl not found as a fallback
    --
    -- not needed since i use base64 integration
    colors = {
      error = { "DiagnosticError", "ErrorMsg", theme.baby_pink },
      warning = { "DiagnosticWarn", "WarningMsg", theme.orange },
      info = { "DiagnosticInfo", theme.teal },
      hint = { "DiagnosticHint", theme.green },
      default = { "Identifier", theme.purple },
      test = { "Identifier", theme.pink },
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      -- regex that will be used to match keywords.
      -- don't replace the (KEYWORDS) placeholder
      pattern = [[\b(KEYWORDS):]], -- ripgrep regex
      -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    },
  },
}
