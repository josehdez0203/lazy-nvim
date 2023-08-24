-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-c>", ":<C-w>q<cr>") -- close current split windows
vim.keymap.set("n", "<C-x>", ":bdelete<cr>") -- close current buffer
