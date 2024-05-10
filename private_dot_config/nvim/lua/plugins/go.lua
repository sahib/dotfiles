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
            -- TODO: There seem to be two formatters running...
            local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
                callback = function()
                    require('go.format').goimport()
                end,
                group = format_sync_grp,
            })

            require("go").setup({
                -- Alter, willst du Stress? Ja.
                trouble = true,
                lsp_cfg = true,
                lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
                lsp_on_attach = true, -- use on_attach from go.nvim
            })
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
