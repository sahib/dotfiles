return {
    {
        -- Find things (files, words, symbols, ...)
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'L3MON4D3/LuaSnip',
            'benfowler/telescope-luasnip.nvim',
        },
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
                            -- (this basically disables normal mode)
                            ["<esc>"] = actions.close,

                            -- Send contents to trouble window
                            ["<c-s>"] = trouble.open_with_trouble,
                        },
                        n = {
                            -- Send contents to trouble window
                            ["<c-s>"] = trouble.open_with_trouble,
                        },
                    },
                },
            })

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<Leader>f', function() builtin.find_files({}) end, { desc = 'Find files' })
            vim.keymap.set('n', '<Leader>q', builtin.live_grep, { desc = 'Live grep' })
            vim.keymap.set('n', '<Leader>Q', builtin.grep_string, { desc = 'Find string under cursor' })
            vim.keymap.set('n', '<Leader>h', builtin.help_tags, { desc = 'List help tags' })

            -- Workaround for stupid issue: https://github.com/nvim-telescope/telescope.nvim/issues/964
            vim.keymap.set('n', '<Leader>S', builtin.lsp_document_symbols, { desc = 'List document symbols' })
            vim.keymap.set('n', '<Leader>s', function() builtin.lsp_workspace_symbols({query = "."}) end, { desc = 'List workspace symbols' })

            -- Load extension for snippets:
            require('telescope').load_extension('luasnip')
    end,
    },
    {
        "benfowler/telescope-luasnip.nvim",
        event = 'VeryLazy',
        lazy = false,
        module = "telescope._extensions.luasnip",
        opts = {}
    },
    -- Add clipboard manager to be easily able to yank several things at the same time.
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = {
            {'nvim-telescope/telescope.nvim'},
        },
        config = function()
            local neoclip = require('neoclip')
            neoclip.setup()
            vim.keymap.set('n', '<Leader>p', ':Telescope neoclip<CR>', { desc = 'Open clipboard' })
        end,
    }
}
