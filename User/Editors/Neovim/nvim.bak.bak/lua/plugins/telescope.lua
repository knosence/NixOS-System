return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      lazy = true,
    },
    {
      "nvim-lua/plenary.nvim",
    },
  },

  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>fb"] = { "<cmd>Telescope buffers previewer=false<cr>", "[F]ind: [B]uffer" },
      ["<leader>gc"] = { "<cmd>Telescope git_branches<cr>", "[G]it: [C]hechout Branch" },
      ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "[F]ind: [C]olorscheme" },
      ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "[F]ind: [F]iles" },
      ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "[F]ind: [k]eymaps" },
      ["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "[F]ind: [P]rojects" },
      ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "[F]ind: Live [G]rep Search" },
      ["<leader>ft"] = { "<cmd>Telescope grep_string<cr>", "[F]ind: Grep on [T]ext" },
      ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "[F]ind: [H]elp" },
      ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "[F]ind: [L]ast Search" },
      ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "[F]ind: [R]ecent File" },
    }

    local icons = require "../config/icons"
    local actions = require "telescope.actions"

    require("telescope").setup {
      defaults = {
        prompt_prefix = icons.ui.Telescope .. " ",
        selection_caret = icons.ui.Forward .. " ",
        entry_prefix = "   ",
        initial_mode = "insert",
        selection_strategy = "reset",
        path_display = { "smart" },
        color_devicons = true,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        },

        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["<esc>"] = actions.close,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["q"] = actions.close,
          },
        },
      },
    }
    buffers = {
      initial_mode = "normal",
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        },
      },
    }

    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    }
  end,
}
