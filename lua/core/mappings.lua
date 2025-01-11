-- Leader
vim.g.mapleader = " "

-- Insert
vim.keymap.set("i", "jj", "<Esc>")

-- Navigation
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlight" })

--NeoTree
vim.keymap.set('n', '<leader>e', ':Neotree left focus<CR>')
vim.keymap.set('n', '<leader>f', ':Neotree float focus<CR>')
vim.keymap.set("n", "<leader>x", ":Neotree close<CR>")

-- Git
vim.keymap.set("n", "<leader>ng", ":Neogit<CR>")
