# https://github.com/0x100101/lab.nvim.git

local M = {
  "0x100101/lab.nvim",
  build = "cd js && npm ci",
  dependencies = { { "nvim-lua/plenary.nvim" } },

}

function M.config()
  require("lab").setup {
    code_runner = {
      enabled = true,
    },
    quick_data = {
      enabled = false,
    },
  }
end

return M
