-- This file contains general, not plugin specific keymaps.
local opts = { noremap = true, silent = true }

-- mapping that opens .vimrc in a new tab for quick editing
vim.api.nvim_set_keymap('n', '<Leader>ev', '<Cmd>tabe $MYVIMRC<CR>', opts)

-- Easier window navigation for non-geniuses like me:
vim.api.nvim_set_keymap('n', '<C-Up>',    '<Cmd>wincmd k<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Down>',  '<Cmd>wincmd j<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Left>',  '<Cmd>wincmd h<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Right>', '<Cmd>wincmd l<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-q>',     '<Cmd>wincmd q<CR>', opts)

-- I just like those fancy guillemets, don't judge:
vim.api.nvim_set_keymap('i', '<Leader><', '«', opts)
vim.api.nvim_set_keymap('i', '<Leader>>', '»', opts)
