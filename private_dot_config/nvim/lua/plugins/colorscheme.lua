-- Github colorscheme:
return {
    'projekt0n/github-nvim-theme',
    config = function()
        -- require('github-theme').setup()
        vim.cmd('colorscheme github_light')
    end,
    opts = {
        dark_sidebar = true,
        dark_float = true,
    },
}
