return {
    -- Find things (files, words, symbols, ...)
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            extensions = {
                fzy_native = {
                    override_generic_sorter = false,
                    override_file_sorter = true,
                }
            },
            defaults = {
                mappings = {
                    i = {
                        -- Exit immediately when hitting ESC
                        ["<esc>"] = actions.close,
                    },
                },
            },
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<Leader>f', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<Leader>g', builtin.live_grep, { desc = 'Find string under cursor' })
        vim.keymap.set('n', '<Leader>b', builtin.buffers, { desc = 'List buffers' })
        vim.keymap.set('n', '<Leader>s', builtin.lsp_document_symbols, { desc = 'List symbols' })
        vim.keymap.set('n', '<Leader>h', builtin.help_tags, { desc = 'List help tags' })
    end,
}
