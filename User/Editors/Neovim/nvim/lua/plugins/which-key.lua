return {
  "folke/which-key.nvim",

  config = function()
    local mappings = {
      c = { name = "[C]ode Tools" },
      q = { "<cmd>confirm q<CR>", "Quit" },
      n = { "<cmd>nohlsearch<CR>", "NOHL" },
      [";"] = { "<cmd>tabnew | terminal<CR>", "Term" },
      v = { "<cmd>vsplit<CR>", "Vertical Split" },
      h = { name = "[H]elp" },
      b = { name = "Buffers" },
      d = { name = "[D]ebug" },
      f = { name = "[F]ind" },
      g = { name = "[G]it" },
      l = { name = "[L]SP" },
      p = { name = "Plugins" },
      t = { name = "[T]est" },
      a = { name = "Cellular [A]utomaton" },
      o = {
        name = "[O]pen",
        n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
        N = { "<cmd>tabnew %<cr>", "New Tab" },
        o = { "<cmd>tabonly<cr>", "Only" },
        h = { "<cmd>-tabmove<cr>", "Move Left" },
        l = { "<cmd>+tabmove<cr>", "Move Right" },
      },
      T = { name = "Treesitter" },
    }

    local which_key = require "which-key"
    which_key.setup {}

    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
    }

    which_key.register(mappings, opts)

    -- Diagnostic keymaps
    vim.keymap.set("n", "<leader>d[", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
    vim.keymap.set("n", "<leader>d]", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
    vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show [D]iagnostic [E]rror messages" })
    vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open [D]iagnostic [Q]uickfix list" })

    --  See `:help wincmd` for a list of all window commands
    vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
    vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
    vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
    vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
  end,
}
