return {
    {
        -- Show a bar on the left side of a window that indicates if a line was
        -- added, modified or deleted.
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        dependencies = {
          'nvim-lua/plenary.nvim'
        },
        config = function ()
            require('gitsigns').setup()
        end
    },
    {
        -- The ":Git" family of commands.
        'tpope/vim-fugitive',
    },
    {
        -- Use <leader>gh to open current file as github link:
        'ruanyl/vim-gh-line',
    }
}
