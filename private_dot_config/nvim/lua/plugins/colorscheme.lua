-- Github colorscheme:
return {
    {
        'projekt0n/github-nvim-theme',
        lazy = false, -- needs to be done very early.
        config = function()
            require('github-theme').setup({})
            vim.cmd('colorscheme github_light')
        end,
    }, {
        "https://git.sr.ht/~swaits/colorsaver.nvim",
        dependencies = {
            'projekt0n/github-nvim-theme',
        },
        lazy = false, -- needs to be done very early.
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
