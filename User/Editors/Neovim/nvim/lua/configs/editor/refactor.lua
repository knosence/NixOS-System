return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup {
        prompt_func_return_type = {
          go = false,
          java = false,
          typescript = true,
          javascript = true,
          lua = true,

          cpp = false,
          c = false,
          h = false,
          hpp = false,
          cxx = false,
        },
        prompt_func_param_type = {
          go = false,
          java = false,

          lua = true,
          typescript = true,
          javascript = true,
          cpp = false,
          c = false,
          h = false,
          hpp = false,
          cxx = false,
        },
        printf_statements = {},
        print_var_statements = {},
        show_success_message = false, -- shows a message with information about the refactor on success
        -- i.e. [Refactor] Inlined 3 variable occurrences
      }
      local map = vim.keymap.set
      map("x", "<leader>re", ":Refactor extract ")
      map("x", "<leader>rf", ":Refactor extract_to_file ")

      map("x", "<leader>rv", ":Refactor extract_var ")

      map({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

      map("n", "<leader>rI", ":Refactor inline_func")

      map("n", "<leader>rb", ":Refactor extract_block")
      map("n", "<leader>rbf", ":Refactor extract_block_to_file")
      -- load refactoring Telescope extension
      require("telescope").load_extension "refactoring"

      map({ "n", "x" }, "<leader>rr", function()
        require("telescope").extensions.refactoring.refactors()
      end)
      -- You can also use below = true here to to change the position of the printf
      -- statement (or set two remaps for either one). This remap must be made in normal mode.
      map("n", "<leader>rp", function()
        require("refactoring").debug.printf { below = false }
      end)

      -- Print var

      map({ "x", "n" }, "<leader>rv", function()
        require("refactoring").debug.print_var()
      end)
      -- Supports both visual and normal mode

      map("n", "<leader>rc", function()
        require("refactoring").debug.cleanup {}
      end)
      -- Supports only normal mode
    end,
  },
}
