-- Github colorscheme:
return {
    'projekt0n/github-nvim-theme',
    even = 'VeryLazy',
    config = function()
        require('github-theme').setup({})
        vim.cmd('colorscheme github_light')
    end,
}
