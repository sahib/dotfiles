return {
    -- Provide the :Mason command to easily install missing language servers:
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim"
        },
        config = function ()
            require("mason").setup()
        end
    },
    -- Trouble shows a quickfix list with the current issues
    -- (i.e. warnings, errors or linting)
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local trouble = require('trouble')
            trouble.setup({
                auto_open = false,
                auto_close = true,
            })

            local opts = function(desc) return { silent = true, desc = desc } end
            vim.keymap.set("n", "<leader>x", function() trouble.open() end, opts("Toggle trouble"))
            vim.keymap.set("n", "[d", function() trouble.next({skip_groups = true, jump = true}) end, opts("Go to next diagnostic"))
            vim.keymap.set("n", "]d", function() trouble.previous({skip_groups = true, jump = true}) end, opts("Go to prev diagnostic"))
        end,
    },
    -- Generally improved UI for LSP with many extra features.
    -- Default keybindings: https://github.com/ray-x/navigator.lua#default-keymaps
    {
        'ray-x/navigator.lua',
        dependencies = {
            { 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
            { 'neovim/nvim-lspconfig' },
        },
        config = function()
            require('navigator').setup({
                lsp = {
                    -- This seems to fuckup Go formatting:
                    format_on_save = false,
                    -- Do not show the sign on the sign column:
                    code_action = {
                        sign = false,
                    },
                    code_lens_action = {
                        sign = false,
                    },
                    -- Don't open the damn quick fix window.
                    display_diagnostic_qf = false,
                },
            })

            local opts = function(desc) return { noremap = true, silent = true, desc = desc } end
            vim.keymap.set('n', '<leader>rn', require('navigator.rename').rename, opts("Rename symbol"))
            vim.keymap.set('n', '<leader>ca', require('navigator.codeAction').code_action, opts("Code Action"))
            vim.keymap.set('n', '<leader>la', require('navigator.codelens').run_action, opts("Code Lens"))
        end,
    },
}
