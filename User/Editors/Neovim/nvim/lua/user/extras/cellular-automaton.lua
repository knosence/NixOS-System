local M = {
  "eandrju/cellular-automaton.nvim",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>al"] = { "<cmd>CellularAutomaton game_of_life<CR>", "[G]ame of Life" },
    ["<leader>as"] = { "<cmd>CellularAutomaton scramble<CR>", "[S]cramble" },
    ["<leader>am"] = { "<cmd>CellularAutomaton make_it_rain<CR>", "[M]ake it Rain" },
  }
end

return M
