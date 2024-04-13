return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local mappings = {
      -- G bindings
      ["g"] = {},

      -- Leader Bindings
      ["<leader>"] = {

        -- increment/decrement numbers
        ["<Up>"] = { "<C-a>", "Increment Number" },
        ["<Down>"] = { "<C-x>", "Decrement Number" },

        -- Buffer management
        ["b"] = {
          name = "[B]uffer",
          ["f"] = { "<cmd>bfirst<CR>", "[Buffer] [F]irst Buffer" },
          ["l"] = { "<cmd>blast<CR>", "[Buffer] [L]ast Buffer" },
          ["<Tab>"] = { "<cmd>bnext<CR>", "[Buffer] [N]ext Buffer" },
          ["<S-Tab>"] = { "<cmd>bprevious<CR>", "[Buffer] [P]revious Buffer" },
          ["x"] = { "<cmd>bdelete<CR>", "[Buffer] [k]ill buffer" },
          ["b"] = { "<cmd>Telescope buffers previewer=false<cr>", "[Buffer] List [B]uffer" },
        },
        -- Code Tools
        -- Diagnostic keymaps
        ["c"] = {
          name = "[C]ode Tools",
          ["<Up>"] = { "<cmd>m .+<cr>==", "[Code] Move Line [Up]" },
          ["<Down>"] = { "<cmd>m .-2<cr>==", "[Code] Move Line [Down]" },
          ["e"] = { vim.diagnostic.open_float, "[Code] Diagnostic [E]rror Messages" },
        },

        -- Debugging
        ["d"] = {
          name = "[D]ebug",
          ["b"] = {
            function()
              require("dap").toggle_breakpoint()
            end,
            "[Debug] [B]reakpoint",
          },
          ["c"] = {
            function()
              require("dap").continue()
            end,
            "[Debug] [C]ontinue",
          },
          ["r"] = {
            function()
              require("dap").step_over()
            end,
            "[Debug] Step Ove[r]",
          },
          ["i"] = {
            function()
              require("dap").step_into()
            end,
            "[Debug] Step [I]nto",
          },
          ["t"] = {
            function()
              require("dap").step_out()
            end,
            "[Debug] Step ou[t]",
          },
        },
        ["e"] = { "<cmd>NvimTreeToggle<cr>", "File Explorer" },
        -- Telescope Find
        ["f"] = {
          name = "[F]ind",
          ["b"] = { "<cmd>Telescope buffers previewer=false<cr>", "[Find] [B]uffer" },
          ["c"] = { "<cmd>Telescope colorscheme<cr>", "[Find] [C]olorscheme" },
          ["f"] = { "<cmd>Telescope find_files<cr>", "[Find] [F]iles" },
          ["k"] = { "<cmd>Telescope keymaps<cr>", "[Find] [k]eymaps" },
          ["p"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "[Find] [P]rojects" },
          ["w"] = { "<cmd>Telescope live_grep<cr>", "[Find] [W]ord Search" },
          ["s"] = { "<cmd>Telescope grep_string<cr>", "[Find] Grep on [S]tring" },
          ["h"] = { "<cmd>Telescope help_tags<cr>", "[Find] [H]elp" },
          ["T"] = { "<cmd>Telescope themes<cr>", "[Find] [T]hemes" },
          ["l"] = { "<cmd>Telescope resume<cr>", "[Find] [L]ast Search" },
          ["r"] = { "<cmd>Telescope oldfiles<cr>", "[Find] [R]ecent File" },
          ["t"] = { "<cmd>TodoTelescope<cr>", "[Find] [T]odos" },
        },
        ["g"] = {
          name = "[G]it",
          ["c"] = { "<cmd>Telescope git_branches<cr>", "[Git] [C]heckout Branch" },
        },
        ["I"] = { "<cmd>LspInfo<CR>", "LspInfo" },
        -- Lazy
        ["l"] = {
          name = "[L]sp",
        },
        ["L"] = { "<cmd>Lazy<CR>", "Lazy" },
        ["n"] = {
          name = "[N]vimTree",
          ["o"] = { ":NvimTreeToggle<cr>", "[NvimTree] [O]pen NvimTree" },
          ["c"] = { "<cmd>NvimTreeToggle<cr>", "[NvimTree] [C]ollapse" },
          ["r"] = { "<cmd>NvimTreeToggle<cr>", "[NvimTree] [R]efresh" },
        },
        ["m"] = {
          name = "[O]pen",
        },
        ["r"] = {
          name = "T[r]ouble",
        },
        -- tab management
        ["t"] = {
          name = "[T]ab",
          ["o"] = { "<cmd>tabnew<CR>", "[Tab] [O]pen new tab" },
          ["x"] = { "<cmd>tabclose<CR>", "[Tab] [C]lose current Tab" },
          ["<Tab>"] = { "<cmd>tabn<CR>", "[Tab] Go to [N]ext Tab" },
          ["<S-Tab>"] = { "<cmd>tabp<CR>", "[Tab] Go to [P]revious Tab" },
          ["d"] = { "<cmd>tabnew %<CR>", "[Tab] [D]uplicate Buffer In New Tab" },
        },
        -- Treesitter
        ["T"] = { "<cmd>InspectTree<cr>", "Treesitter Inspect [T]ree" },
        -- window management
        ["w"] = {
          name = "[W]indow",
          ["o"] = { "<C-w>v", "[Window] [O]pen Split" },
          ["h"] = { "<C-w>s", "[Window] Split [horizontally]" },
          ["e"] = { "<C-w>=", "[Window] Make Splits [E]qual Size" },
          ["x"] = { "<cmd>close<CR>", "[Window] [C]lose Current Split" },
          ["<S-Tab>"] = { "<C-w><C-h>", "[Window] Move focus [Left]" },
          ["<Tab>"] = { "<C-w><C-l>", "[Window] Move focus [Right]" },
          ["<down>"] = { "<C-w><C-j>", "[Window] Move focus [Down]" },
          ["<up>"] = { "<C-w><C-k>", "[Window] Move focus [Up]" },
        },
        -- Console
        ["x"] = {},
        -- tab management
        ["z"] = {
          name = "[Z]ellij",
          ["p"] = { ":ZellijNewPane<CR>", "[Tab] [O]pen new tab" },
          ["t"] = { ":ZellijNewTab<CR>", "[Tab] [C]lose current Tab" },
          ["P"] = { ":ZellijRenamePane<CR>", "[Tab] Go to [N]ext Tab" },
          ["T"] = { "ZellijRenameTab<CR>", "[Tab] Go to [P]revious Tab" },
          ["<Up>"] = { "ZellijNavigate<Up><CR>", "[Tab] Nav Up" },
          ["<Down>"] = { "ZellijNavigate<Down><CR>", "[Tab] Nav Down" },
          ["<Right>"] = { "ZellijNavigate<Right><CR>", "[Tab] [D]uplicate Buffer In New Tab" },
          ["<Left>"] = { "ZellijNavigate<Left><CR>", "[Tab] [D]uplicate Buffer In New Tab" },
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
