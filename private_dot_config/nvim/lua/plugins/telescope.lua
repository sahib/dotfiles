return {
    -- Find things (files, words, symbols, ...)
    'nvim-telescope/telescope.nvim',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    init = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<Leader>f', builtin.find_files, {})
        vim.keymap.set('n', '<Leader>g', builtin.grep_string, {})
        vim.keymap.set('n', '<Leader>G', builtin.live_grep, {})
        vim.keymap.set('n', '<Leader>S', builtin.grep_string, {})
        vim.keymap.set('n', '<Leader>b', builtin.buffers, {})
        vim.keymap.set('n', '<Leader>s', builtin.lsp_document_symbols, {})
        vim.keymap.set('n', '<Leader>h', builtin.help_tags, {})
        vim.keymap.set('n', '<Leader>t', builtin.treesitter, {})
    end,
    opts = {
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            }
        },
    }
}
