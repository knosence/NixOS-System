if vim.g.neovide then
  return {}
end

return {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    require("neoscroll").setup(opts)
  end,
  opts = {
    mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = false, -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = "sine", -- Default easing function == nil
    pre_hook = nil, -- Function to run before the scrolling animation starts
    post_hook = nil, -- Function to run after the scrolling animation ends
    performance_mode = false, -- Disable "Performance Mode" on all buffers.
  },
}
