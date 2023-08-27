vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- better up/down
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- keymap.set("n", "∆", ":m .+1<cr>==", { desc = "Move down", silent = true })
-- keymap.set("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- keymap.set("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- keymap.set("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- keymap.set("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- keymap.set("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
keymap.set({ "n", "i" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Stay in indent mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<cr>", { noremap = true, silent = true })
keymap.set("n", "<S-h>", ":bprevious<cr>", { noremap = true, silent = true })

-- Add undo break-points
keymap.set("i", ",", ",<c-g>u")
keymap.set("i", ".", ".<c-g>u")
keymap.set("i", ";", ";<c-g>u")

-- save file
keymap.set({"i", "v", "n", "s"}, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- new file
keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Disable the <Space> key 
-- keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- keymap.set("n", "<leader>e", ":Lex 30<cr>", { noremap = true, silent = true })
-- Keymaps for better default experience
