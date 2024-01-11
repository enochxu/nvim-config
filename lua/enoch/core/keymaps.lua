local keymap = vim.keymap

vim.g.mapleader = " "

-- Save key strokes (now we do not need to press shift to enter command mode).
keymap.set({ "n", "x" }, ";", ":")

-- Turn the word under cursor to upper case
keymap.set("i", "<c-u>", "<Esc>viwUea")

-- Turn the current word into title case
keymap.set("i", "<c-t>", "<Esc>b~lea")

-- Quit all opened buffers
keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })

-- Move current line up and down
-- To get this working for mac
keymap.set("n", "∆", ":m .+1<CR>==") -- move line up(n)
keymap.set("n", "˚", ":m .-2<CR>==") -- move line down(n)
