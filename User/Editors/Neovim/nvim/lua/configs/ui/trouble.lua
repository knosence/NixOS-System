local setup = {
  position = "bottom", -- position of the list can be: bottom, top, left, right
  height = 10, -- height of the trouble list when position is top or bottom
  width = 50, -- width of the list when position is left or right
  icons = true, -- use devicons for filenames
  mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  fold_open = "", -- icon used for open folds
  fold_closed = "", -- icon used for closed folds
  group = true, -- group results by file
  padding = true, -- add an extra new line on top of the list
  cycle_results = true, -- cycle item list when reaching beginning or end of list
  action_keys = { -- key mappings for actions in the trouble list
    -- map to {} to remove a mapping, for example:
    -- close = {},
    close = "q", -- close the list
    cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
    refresh = "r", -- manually refresh
    jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
    open_split = { "<c-x>" }, -- open buffer in new split
    open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
    open_tab = { "<c-t>" }, -- open buffer in new tab
    jump_close = { "o" }, -- jump to the diagnostic and close the list
    toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
    switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
    toggle_preview = "P", -- toggle auto_preview
    hover = "K", -- opens a small popup with the full multiline message
    preview = "p", -- preview the diagnostic location
    open_code_href = "c", -- if present, open a URI with more information about the diagnostic error
    close_folds = { "zM", "zm" }, -- close all folds
    open_folds = { "zR", "zr" }, -- open all folds
    toggle_fold = { "zA", "za" }, -- toggle fold of current file
    previous = "k", -- previous item
    next = "j", -- next item
    help = "?", -- help menu
  },
  multiline = true, -- render multi-line messages
  indent_lines = true, -- add an indent guide below the fold icons
  win_config = { border = "single" }, -- window configuration for floating windows. See |nvim_open_win()|.
  auto_open = false, -- automatically open the list when you have diagnostics
  auto_close = false, -- automatically close the list when you have no diagnostics
  auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
  auto_fold = false, -- automatically fold a file trouble list at creation
  auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
  include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" }, -- for the given modes, include the declaration of the current symbol in the results
  signs = {
    -- icons / text used for a diagnostic
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "",
  },
  use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
}

return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- dofile(vim.g.base46_cache .. "trouble")
    require("trouble").setup(setup)
    local actions = require "telescope.actions"
    local trouble = require "trouble.providers.telescope"

    local telescope = require "telescope"

    telescope.setup {
      defaults = {
        mappings = {
          i = { ["<c-t>"] = trouble.open_with_trouble },
          n = { ["<c-t>"] = trouble.open_with_trouble },
        },
      },
    }

    local map = vim.keymap.set
    map("n", "<leader>tr", ":TroubleToggle<CR>", { desc = "Trouble - Toggle" })
    map("n", "<leader>gd", ":TroubleToggle workspace_diagnostics<CR>", { desc = "Trouble - Workspace Diagnostics" })
    map("n", "<leader>cq", "<CMD>TroubleToggle quickfix<CR>", { desc = "Trouble - Quickfix" })
    map("n", "<leader>fd", "<CMD>TodoTrouble<CR>", { desc = "Trouble - Todo" })
    map("n", "gd", "<CMD>Trouble lsp_definitions<CR>", { desc = "Trouble - Definition" })
    map("n", "gi", "<CMD>Trouble lsp_implementations<CR>", { desc = "Trouble - Implementations" })
    map("n", "gD", "<CMD>Trouble lsp_type_definitions<CR>", { desc = "Trouble - Type Definition" })
  end,
}
