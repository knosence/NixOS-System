return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local mappings = {
      -- Leader Bindings
      ["<leader>"] = {
        -- increment/decrement numbers
        ["+"] = { "C-a", "Increment Number" },
        ["-"] = { "C-x", "Decrement Number" },

        -- Lazy
        ["L"] = { "<cmd>Lazy<CR>", "Lazy" },

        -- window management
        ["w"] = {
          name = "[W]indow",
          ["o"] = { "<C-w>v", "[Window] [O]pen Split" },
          ["h"] = { "<C-w>s", "[Window] Split [horizontally]" },
          ["e"] = { "<C-w>=", "[Window] Make Splits [E]qual Size" },
          ["x"] = { "<cmd>close<CR>", "[Window] [C]lose Current Split" },
          ["<left>"] = { "<C-w><C-h>", "[Window] Move focus [Left]" },
          ["<right>"] = { "<C-w><C-l>", "[Window] Move focus [Right]" },
          ["<down>"] = { "<C-w><C-j>", "[Window] Move focus [Down]" },
          ["<up>"] = { "<C-w><C-k>", "[Window] Move focus [Up]" },
        },
        -- tab management
        ["t"] = {
          name = "[T]ab",
          ["o"] = { "<cmd>tabnew<CR>", "[Tab] [O]pen new tab" },
          ["x"] = { "<cmd>tabclose<CR>", "[Tab] [C]lose current Tab" },
          ["n"] = { "<cmd>tabn<CR>", "[Tab] Go to [N]ext Tab" },
          ["p"] = { "<cmd>tabp<CR>", "[Tab] Go to [P]revious Tab" },
          ["d"] = { "<cmd>tabnew %<CR>", "[Tab] [D]uplicate Buffer In New Tab" },
        },
        -- Code Tools
        -- Diagnostic keymaps
        ["c"] = {
          name = "[C]ode Tools",
          -- ["e"] = { vim.diagnostic.open_float, "[Code] Diagnostic [E]rror Messages" },
          -- ["D"] = { vim.diagnostic.goto_prev, "[Code] Pprevious [D]iagnostic Error" },
          -- ["d"] = { vim.diagnostic.goto_next, "[Code] Next [d]iagnostic Error" },
          -- ["q"] = { vim.diagnostic.setloclist, "[Code] Diagnostic [Q]uickfix List" },
        },
      },
    }

    local which_key = require "which-key"
    which_key.setup {}

    local opts = {
      mode = "n", -- NORMAL mode
    }

    which_key.register(mappings, opts)
  end,
}
