return {
    {
        -- Find things (files, words, symbols, ...)
        'nvim-telescope/telescope.nvim',
        dependencies = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            local actions = require("telescope.actions")
            local trouble = require("trouble.providers.telescope")

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

                            -- Send contents to trouble window
                            ["<c-t>"] = trouble.open_with_trouble,
                        },
                        n = {
                            -- Send contents to trouble window
                            ["<c-t>"] = trouble.open_with_trouble,
                        },
                    },
                },
            })

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<Leader>f', builtin.find_files, { desc = 'Find files' })
            vim.keymap.set('n', '<Leader>g', builtin.live_grep, { desc = 'Find string under cursor' })
            vim.keymap.set('n', '<Leader>s', builtin.lsp_document_symbols, { desc = 'List document symbols' })
            vim.keymap.set('n', '<Leader>S', builtin.lsp_workspace_symbols, { desc = 'List workspace symbols' })
            vim.keymap.set('n', '<Leader>h', builtin.help_tags, { desc = 'List help tags' })
    end,
    }, {
        -- Provide a global list of files that are sorted (roughly) by last access time
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
          require("telescope").load_extension("frecency")
          vim.keymap.set('n', '<Leader>F', '<Cmd>Telescope frecency<CR>', { desc = 'Find via frecency' })
        end,
    }
}
