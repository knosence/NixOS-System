return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local wk = require "which-key"
    wk.register {
      ["<leader>"] = {
        ["f"] = {
          name = "[F]ind",
          ["b"] = { "<cmd>Telescope buffers previewer=false<cr>", "[Find] [B]uffer" },
          ["c"] = { "<cmd>Telescope colorscheme<cr>", "[Find] [C]olorscheme" },
          ["f"] = { "<cmd>Telescope find_files<cr>", "[Find] [F]iles" },
          ["k"] = { "<cmd>Telescope keymaps<cr>", "[Find] [k]eymaps" },
          ["p"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "[Find] [P]rojects" },
          ["g"] = { "<cmd>Telescope live_grep<cr>", "[Find] Live [G]rep Search" },
          ["s"] = { "<cmd>Telescope grep_string<cr>", "[Find] Grep on [S]tring" },
          ["h"] = { "<cmd>Telescope help_tags<cr>", "[Find] [H]elp" },
          ["l"] = { "<cmd>Telescope resume<cr>", "[Find] [L]ast Search" },
          ["r"] = { "<cmd>Telescope oldfiles<cr>", "[Find] [R]ecent File" },
          ["t"] = { "<cmd>TodoTelescope<cr>", "[Find] [T]odos" },
        },
        ["g"] = {
          name = "[G]it",
          ["c"] = { "<cmd>Telescope git_branches<cr>", "[Git] [C]heckout Branch" },
        },
      },
    }

    local telescope = require "telescope"
    local actions = require "telescope.actions"
    telescope.setup {
      defaults = {
        path_display = { "smart" },
        mappings = {
          -- Tab selects results within telescope
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
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
    telescope.load_extension "fzf"
  end,
}
