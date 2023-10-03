return {
    {
        -- run tests from within neovim:
        -- (this partly overlaps with the functionality of ray-x/go)
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-go"
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-go")({}),
                },
            })

            local api = require("neotest")
            local run_all_tests = function()
                api.run.run(vim.fn.expand("%"))
            end

            vim.keymap.set('n', '<leader>t', api.run.run, {
                noremap = true,
                silent = true,
                desc = 'Run current test',
            })
            vim.keymap.set('n', '<leader>T', run_all_tests, {
                noremap = true,
                silent = true,
                desc = 'Run all tests',
            })
        end,
    },
}
