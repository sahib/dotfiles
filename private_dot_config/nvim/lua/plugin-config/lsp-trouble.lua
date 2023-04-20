local opts = {silent = true, noremap = true}
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
vim.api.nvim_set_keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)
vim.api.nvim_set_keymap("n", "gD", "<cmd>TroubleToggle lsp_definitions<cr>", opts)
vim.api.nvim_set_keymap("n", "gT", "<cmd>TroubleToggle lsp_type_definitions<cr>", opts)
require('trouble').setup{}
