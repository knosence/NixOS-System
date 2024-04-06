local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    -- general tests
    "vim-test/vim-test",
    "nvim-neotest/neotest-vim-test",
    -- language specific tests
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "rouge8/neotest-rust",
    "lawrence-laz/neotest-zig",
    "rcasia/neotest-bash",
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>qt"] = { "<cmd>lua require'neotest'.run.run()<cr>", "[N]eotest: [T]est Nearest" },
    ["<leader>qf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "[N]eotest: Test [F]ile" },
    ["<leader>qd"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "[N]eotest: [D]ebug Test" },
    ["<leader>qs"] = { "<cmd>lua require('neotest').run.stop()<cr>", "[N]eotest: Test [S]top" },
    ["<leader>qa"] = { "<cmd>lua require('neotest').run.attach()<cr>", "[N]eotest: [A]ttach Test" },
  }

  ---@diagnostic disable: missing-fields
  require("neotest").setup {
    adapters = {
      require "neotest-python" {
        dap = { justMyCode = false },
      },
      require "neotest-vitest",
      require "neotest-zig",
      require "neotest-vim-test" {
        ignore_file_types = { "python", "vim", "lua", "javascript", "typescript" },
      },
    },
  }
end

return M
