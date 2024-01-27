-- Github colorscheme:
return {
    {
        'projekt0n/github-nvim-theme',
        event = 'VeryLazy',
        config = function()
            require('github-theme').setup({})
            --vim.cmd('colorscheme github_light')
            vim.cmd('colorscheme github_dark_high_contrast')
        end,
    }, {
        "https://git.sr.ht/~swaits/colorsaver.nvim",
        lazy = true,
        event = "VimEnter",
        opts = {
            -- This will make sure to save the colorscheme that we used last
            -- is used in new sessions and also synchronized to other nvims.
            auto_load = true,
            -- The file where the above info is persisted to.
            filename = "colorsaver",
        },
    }
}
