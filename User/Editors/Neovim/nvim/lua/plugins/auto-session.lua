return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require "auto-session"
    auto_session.setup {
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    }
    local wk = require "which-key"
    wk.register {
      ["<leader>"] = {
        ["s"] = {
          name = "[S]ession",
          ["r"] = { "<cmd>SessionRestore<cr>", "[Session] [R]estore session for cwd" },
          ["s"] = { "<cmd>SessionSave<cr>", "[Session] [S]ave Session for auto session root dir" },
        },
      },
    }
  end,
}
