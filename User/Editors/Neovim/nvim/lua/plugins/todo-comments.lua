-- HACK:
-- BUG:
-- TODO:

return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require "todo-comments"
    -- set keymaps
    local wk = require "which-key"
    wk.register {
      ["<leader>"] = {
        ["c"] = {
          ["t"] = {
            function()
              todo_comments.jump_next()
            end,
            "[Code] Next [t]odo",
          },
          ["T"] = {
            function()
              todo_comments.jump_prev()
            end,
            "[Code] Previous [T]odo",
          },
        },
      },
    }

    todo_comments.setup()
  end,
}
