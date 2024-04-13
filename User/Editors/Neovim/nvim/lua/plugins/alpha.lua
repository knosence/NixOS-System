local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
}

function M.config()
  local dashboard = require "alpha.themes.dashboard"
  local icons = require "configs.icons"

  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Include"
    return b
  end
  -- TODO update the banner to KnoVim
  dashboard.section.header.val = {
    [[██╗ .██╗███╗🛸 ██╗ ██████╗ ██╗ ° ██╗██╗███╗ ° ███╗]],
    [[██║ ██╔╝████╗° ██║██╔═══██╗██║🛰 ██║██║████╗ ████║]],
    [[█████╔╝•██╔██╗ ██║██║ •★██║██║ ✯ ██║██║██╔████╔██║]],
    [[██╔═██╗ ██║╚██╗██║██║★  ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
    [[██║° ██╗██║.╚████║╚██████╔╝ ╚████╔╝ ██║██║✯╚═╝ ██║]],
    [[╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝🪐 ╚═══╝ •╚═╝╚═╝   ° ╚═╝]],
  
  }
  dashboard.section.buttons.val = {
    button("f", icons.ui.Files .. " Find [F]ile", ":Telescope find_files <CR>"),
    button("n", icons.ui.NewFile .. " [N]ew file", ":ene <BAR> startinsert <CR>"),
    button("p", icons.git.Repo .. " Find [P]roject", ":lua require('telescope').extensions.projects.projects()<CR>"),
    button("r", icons.ui.History .. " [R]ecent files", ":Telescope oldfiles <CR>"),
    button("s", icons.ui.History .. " [S]ession Restore", ":SessionRestore <CR>"),
    button("t", icons.ui.Text .. " Find [T]ext", ":Telescope live_grep <CR>"),
    button("c", icons.ui.Gear .. " [C]onfig", ":e ~/.system/flake.nix <CR>"),
    button("q", icons.ui.SignOut .. " [Q]uit", ":qa<CR>"),
  }
  local function footer()
    return "It-starts-HERE.com"
  end

  dashboard.section.footer.val = footer()

  dashboard.section.header.opts.hl = "Keyword"
  dashboard.section.buttons.opts.hl = "Include"
  dashboard.section.footer.opts.hl = "Type"

  dashboard.opts.opts.noautocmd = true
  require("alpha").setup(dashboard.opts)

  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
      vim.cmd [[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
    end,
  })
end

return M
