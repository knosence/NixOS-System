vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

keymap.set("n", "<esc><esc>", ":nohl<CR>", { desc = "Clear search highlights" })
