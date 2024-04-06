local keymap = vim.keymap.set
local opts = { noremap = true, silent = true, desc = "" }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<m-Left>", "<C-w>h", opts)
keymap("n", "<m-Down>", "<C-w>j", opts)
keymap("n", "<m-Up>", "<C-w>k", opts)
keymap("n", "<m-Down>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)
keymap(
  "n",
  "<leader>cw",
  ":lua vim.wo.wrap = not vim.wo.wrap<CR>",
  { noremap = true, silent = true, desc = "[C]ode: [W]rap/NoWrap" }
)

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)

keymap("n", "<leader>tm", "<cmd>+tabmove<cr>", { desc = "[T]abs: [m]ove Right" })
keymap("n", "<leader>tM", "<cmd>-tabmove<cr>", { desc = "[T]abs: [M]ove Left" })
keymap("n", "<leader>tn", "<cmd>tabnext<cr>", { desc = "[T]abs: [N]ext" })
keymap("n", "<leader>tp", "<cmd>tabPrevious<cr>", { desc = "[T]abs: [P]revious" })

keymap("n", "<S-Down>", "<C-d>zz", opts)
keymap("n", "<S-Up>", "<C-u>zz", opts)
keymap("n", "<S-Right>", "$", opts)
keymap("n", "<S-left>", "0", opts)

keymap("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })

keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- lazy
keymap("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
