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
    -- Auto-format files using their LSP functonality
    {
        "lukas-reineke/lsp-format.nvim",
        opts = {
            -- the go plugin takes that over
            -- and does some things like autoimports.
            go = {
                exclude = { "gopls" }
            },
        },
    },
    -- Trouble shows a quickfix list with the current issues
    -- (i.e. warnings, errors or linting)
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local opts = function(desc) return { noremap = true, silent = true, desc = desc } end
            vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>TroubleToggle<CR>', opts("Toggle trouble"))
            vim.api.nvim_set_keymap('n', '<leader>xq', '<cmd>TroubleToggle quickfix<CR>', opts("Toggle quickfix list"))
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
                    format_on_save = true,
                    -- Do not show the sign on the sign column:
                    code_action = {
                        sign = false,
                    },
                    code_lens_action = {
                        sign = false,
                    },
                },
            })

            local opts = function(desc) return { noremap = true, silent = true, desc = desc } end
            vim.keymap.set('n', '<leader>rn', require('navigator.rename').rename, opts("Rename symbol"))
            vim.keymap.set('n', '<leader>ca', require('navigator.codeAction').code_action, opts("Code Action"))
            vim.keymap.set('n', '<leader>la', require('navigator.codelens').run_action, opts("Code Lens"))
        end,
    },
}
