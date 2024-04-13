return {
  "SmiteshP/nvim-navic",

  config = function()
    local icons = require "configs.icons"
    require("nvim-navic").setup {
      icons = icons.kind,
      highlight = true,
      lsp = {
        auto_attach = true,
      },
      click = true,
      separator = " " .. icons.ui.ChevronRight .. " ",
      depth_limit = 0,
      depth_limit_indicator = "..",
    }
  end,
}
