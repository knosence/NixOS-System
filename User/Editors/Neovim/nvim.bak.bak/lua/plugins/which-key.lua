return {
  "folke/which-key.nvim",

  config = function()
    local mappings = {
      Q = { "<cmd>confirm q<CR>", "Quit" },
      [";"] = { "<cmd>tabnew | terminal<CR>", "Term" },
      V = { "<cmd>vsplit<CR>", "Vertical Split" },
      c = { name = "[C]ode Tools" },
      h = { name = "[H]elp" },
      d = { name = "[D]ebug" },
      f = { name = "[F]ind" },
      g = { name = "[G]it" },
      l = { name = "[L]SP" },
      t = { name = "[T]abs" },
      w = { name = "[W]indows" },
      q = { name = "[Q]A" },
      a = { name = "Cellular [A]utomaton" },
      T = { name = "Treesitter" },
      o = {
        name = "[O]pen",
      },
      k = {
        name = "[K]ill",
        b = { "<cmd>bd!<cr>", "[k]ill: [B]uffer" },
      },
      n = {
        name = "[N]ew",
        t = { "<cmd>tabnew %<cr>", "[N]ew: [T]ab" },
      },
    }

    local which_key = require "which-key"
    which_key.setup {}

    local opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
    }

    which_key.register(mappings, opts)

    -- Diagnostic keymaps
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic message" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic Message" })
    vim.keymap.set("n", "<leader>oe", vim.diagnostic.open_float, { desc = "[O]pen: Diagnostic [E]rror Messages" })
    vim.keymap.set("n", "<leader>oq", vim.diagnostic.setloclist, { desc = "[O]pen: Diagnostic [Q]uickfix List" })

    --  See `:help wincmd` for a list of all window commands
    vim.keymap.set("n", "<leader>w<Left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
    vim.keymap.set("n", "<leader>w<Right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
    vim.keymap.set("n", "<leader>w<Down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
    vim.keymap.set("n", "<leader>w<Up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

    vim.keymap.set("n", "<leader>ol", "<cmd>Lazy<cr>", { desc = "[O]pen: [L]azy" })
  end,
}
