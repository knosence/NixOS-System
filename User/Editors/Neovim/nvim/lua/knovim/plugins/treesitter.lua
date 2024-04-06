return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>"] = {
        ["T"] = {
          name = "[T]reesitter",
          ["t"] = { "<cmd>InspectTree<cr>", "[Treesitter] Inspect [T]ree" },
        },
      },
    }

    -- import nvim-treesitter plugin
    local treesitter = require "nvim-treesitter.configs"

    -- configure treesitter
    treesitter.setup { -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      auto_install = true,
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    }
  end,
}
