local settings = require "settings"
return {
  "smjonas/inc-rename.nvim",
  event = "VeryLazy",
  config = function()
    require("noice").setup {
      presets = { inc_rename = true },
    }

    -- dressing config
    -- require("dressing").setup {
    --   input = {
    --     override = function(conf)
    --       conf.col = -1
    --       conf.row = 0
    --       return conf
    --     end,
    --   },
    -- }

    require("inc_rename").setup {
      cmd_name = "IncRename", -- the name of the command
      hl_group = "Substitute", -- the highlight group used for highlighting the identifier's new name
      preview_empty_name = false, -- whether an empty new name should be previewed; if false the command preview will be cancelled instead
      show_message = true, -- whether to display a `Renamed m instances in n files` message after a rename operation
      input_buffer_type = nil, -- the type of the external input buffer to use (the only supported value is currently "dressing")
      post_hook = nil, -- callback to run after renaming, receives the result table (from LSP handler) as an argument
    }
  end,
}
