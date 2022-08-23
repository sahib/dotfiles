-- defaults
local opts = { noremap = true, silent = true }

-- mapping that opens .vimrc in a new tab for quick editing
vim.api.nvim_set_keymap('n', '<Leader>ev', '<Cmd>tabe $MYVIMRC<CR>', opts)

-- LSP
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)

-- autocomplete
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? "<C-n><Esc>a" : "<CR>"', {expr = true, noremap = true, silent = true})

-- Easier window navigation for non-geniuses like me:
vim.api.nvim_set_keymap('n', '<C-Up>',    '<Cmd>wincmd k<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Down>',  '<Cmd>wincmd j<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Left>',  '<Cmd>wincmd h<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-Right>', '<Cmd>wincmd l<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-q>',     '<Cmd>wincmd q<CR>', opts)

-- I just like those fancy guillemets, don't judge:
vim.api.nvim_set_keymap('i', '<Leader><', '«', opts)
vim.api.nvim_set_keymap('i', '<Leader>>', '»', opts)
