local options = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "󰍵" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "│" },
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function opts(desc)
      return { buffer = bufnr, desc = desc }
    end

    local map = vim.keymap.set
    map("n", "<leader>gh", gs.reset_hunk, opts "[Git] Reset Hunk")
    map("n", "<leader>gh", gs.preview_hunk, opts "[Git] Preview Hunk")
    map("n", "<leader>gb", gs.blame_line, opts "[Git] Blame Line")
    local wk = require "which-key"
    wk.register {
      ["<leader>"] = {
        ["g"] = {},
      },
    }
  end,
}

return options
