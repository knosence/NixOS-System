return {
  "Lilja/zellij.nvim",
  -- -- If you want to configure the plugin
  config = function()
    require("zellij").setup {
      {
        -- keys with designated default values.
        path = "zellij", -- Zellij binary path
        replaceVimWindowNavigationKeybinds = false, -- Will set keybinds like <C-w>h to left
        vimTmuxNavigatorKeybinds = false, -- Will set keybinds like <C-h> to left
        debug = false, -- Will log things to /tmp/zellij.nvim
      },
    }
  end,
}
