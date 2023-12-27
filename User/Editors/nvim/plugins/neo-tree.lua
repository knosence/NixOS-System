require('neo-tree').setup({
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "MunifTanJim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>e", ":Neotree toggle right<CR>", {})
  end,
})
