return {
  "neogitorg/neogit",
  event = "VeryLazy",

  config = function()
    local icons = require "configs.icons"
    local wk = require "which-key"
    wk.register {
      ["<leader>gn"] = { "<cmd>Neogit<CR>", "[Git] [N]eogit" },
    }

    require("neogit").setup {
      auto_refresh = true,
      disable_builtin_notifications = false,
      use_magit_keybindings = false,
      -- Change the default way of opening neogit
      kind = "tab",
      -- Change the default way of opening the commit popup
      commit_popup = {
        kind = "split",
      },
      -- Change the default way of opening popups
      popup = {
        kind = "split",
      },
      -- customize displayed signs
      signs = {
        -- { CLOSED, OPENED }
        section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
        item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
        hunk = { "", "" },
      },
    }
  end,
}
