-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local opts = { noremap = true, silent = true }

-- Easier window navigation for non-geniuses like me:
vim.api.nvim_set_keymap("n", "<C-Up>", "<Cmd>wincmd k<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", "<Cmd>wincmd j<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Left>", "<Cmd>wincmd h<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", "<Cmd>wincmd l<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-q>", "<Cmd>wincmd q<CR>", opts)

-- I just like those fancy guillemets, don't judge:
vim.api.nvim_set_keymap("i", "<C-<>", "«", opts)
vim.api.nvim_set_keymap("i", "<C->>", "»", opts)

-- Center the screen when hopping through search results:
vim.keymap.set("n", "n", "nzzzv", { desc = "Fwd  search '/' or '?'" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Back search '/' or '?'" })
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear search" })

-- Easy copying in visual mode:
vim.api.nvim_set_keymap("v", "q", '"+y', opts)

-- I often type :W or :Q (because I'm stupid) for saving:
for _, v in ipairs({ "W", "Q", "Wq", "WQ" }) do
  vim.api.nvim_create_user_command(v, v:lower(), {})
end
