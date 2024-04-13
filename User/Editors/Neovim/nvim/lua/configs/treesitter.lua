local options = {
  auto_install = true,
  ensure_installed = {
    "tsx",
    "prisma",
    "lua",
    "vimdoc",
    "html",
    "css",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

return options
