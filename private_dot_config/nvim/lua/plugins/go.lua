return {
    {
        -- all :Go commands and important things like GoImport etc.
        'ray-x/go.nvim',
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            -- do format and import on save:
            local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    require('go.format').goimport()
                end,
                group = format_sync_grp,
            })

            require("go").setup()

            -- NOTE: This works for Go only currently. There are other plugins that might be a bit better:
            -- https://www.dev-log.me/Jump_between_test_files_and_implementation_in_Vim
            vim.keymap.set('n', '<Leader>a', '<Cmd>GoAlt!<CR>', { silent = true, desc = 'Go to test file or back' })
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()'
    },
    {
        -- Open a Go Playground with :GPToggle
        "jeniasaigak/goplay.nvim",
        config = function()
            require('goplay').setup()
        end,
    },
    {
        -- Show coverage output directly in Go:
        'rafaelsq/nvim-goc.lua',
        config = function()
            -- if set, when we switch between buffers, it will not split more than once. It will switch to the existing buffer instead
            vim.opt.switchbuf = 'useopen'

            local goc = require 'nvim-goc'
            goc.setup({ verticalSplit = false })                                     -- default to horizontal

            vim.keymap.set('n', '<Leader>gcf', goc.Coverage, { desc = 'Show coverage for file', silent = true })
            vim.keymap.set('n', '<Leader>gct', goc.CoverageFunc, { desc = 'Show coverage for test', silent = true })
            vim.keymap.set('n', '<Leader>gcc', goc.ClearCoverage, { desc = 'Clear coverage', silent = true })
        end
    }
}
