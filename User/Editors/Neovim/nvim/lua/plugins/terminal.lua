return {
  "rebelot/terminal.nvim",
  config = function()
    require("terminal").setup()
    local term_map = require "terminal.mappings"
    vim.keymap.set({ "n", "x" }, "<leader>xs", term_map.operator_send, { expr = true })
    vim.keymap.set("n", "<leader>xo", term_map.toggle)
    vim.keymap.set("n", "<leader>xO", term_map.toggle { open_cmd = "enew" })
    vim.keymap.set("n", "<leader>xr", term_map.run)
    vim.keymap.set("n", "<leader>xR", term_map.run(nil, { layout = { open_cmd = "enew" } }))
    vim.keymap.set("n", "<leader>xk", term_map.kill)
    vim.keymap.set("n", "<leader>x<Tab>", term_map.cycle_next)
    vim.keymap.set("n", "<leader>x<S-Tab>", term_map.cycle_prev)
    vim.keymap.set("n", "<leader>xl", term_map.move { open_cmd = "belowright vnew" })
    vim.keymap.set("n", "<leader>xL", term_map.move { open_cmd = "botright vnew" })
    vim.keymap.set("n", "<leader>xh", term_map.move { open_cmd = "belowright new" })
    vim.keymap.set("n", "<leader>xH", term_map.move { open_cmd = "botright new" })
    vim.keymap.set("n", "<leader>xf", term_map.move { open_cmd = "float" })
  end,
}
