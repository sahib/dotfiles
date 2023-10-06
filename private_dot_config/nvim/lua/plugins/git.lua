return {
    {
        -- Show a bar on the left side of a window that indicates if a line was
        -- added, modified or deleted.
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = function ()
            local neogit = require('neogit')
            neogit.setup()
            vim.keymap.set('', '<leader>G', function() neogit.open({kind = "auto"}) end, { desc = "Open Neogit" })
        end
    },
    {
        -- Use <leader>gh to open current file as github link:
        'ruanyl/vim-gh-line',
    }
}
