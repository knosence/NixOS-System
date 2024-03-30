return {
  "numToStr/Comment.nvim",
  lazy = false,
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
  },

  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>cc"] = { "<Plug>(comment_toggle_linewise_current)", "[C]omment" },
    }

    wk.register {
      ["<leader>cc"] = { "<Plug>(comment_toggle_linewise_visual)", "[C]omment", mode = "v" },
    }

    vim.g.skip_ts_context_commentstring_module = true
    ---@diagnostic disable: missing-fields
    require("ts_context_commentstring").setup {
      enable_autocmd = false,
    }

    require("Comment").setup {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    }
  end,
}
