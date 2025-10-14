 vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "kj", "<Esc>")

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected lines up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected lines down" })

-- Move between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { silent = true, desc = "Move to the window to the left" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { silent = true, desc = "Move to the window to the right" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { silent = true, desc = "Move to the window above" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { silent = true, desc = "Move to the window below" })

-- Resize windows
vim.keymap.set("n", "<A-h>", "<C-w><C-<>", { silent = true, desc = "current window columns - 1" })
vim.keymap.set("n", "<A-l>", "<C-w><C->>", { silent = true, desc = "current window columns + 1" })
vim.keymap.set("n", "<A-j>", "<C-w><C-->", { silent = true, desc = "current window rows - 1" })
vim.keymap.set("n", "<A-k>", "<C-w><C-+>", { silent = true, desc = "current window rows + 1" })
