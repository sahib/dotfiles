return {
    -- Show a bar on the left side of a window that indicates if a line was
    -- added, modified or deleted.
    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    },
    -- Integration for lazygit (external program).
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            vim.keymap.set('', '<leader>G', '<Cmd>:LazyGit<CR>', { desc = "Open LazyGit" })
        end
    },
    -- Use <leader>gh to open current file as github link:
    {
        'ruanyl/vim-gh-line',
    },
    -- {
    --     'pwntester/octo.nvim',
    --     requires = {
    --         'nvim-lua/plenary.nvim',
    --         'nvim-telescope/telescope.nvim',
    --         'nvim-tree/nvim-web-devicons',
    --     },
    --     config = function ()
    --         require"octo".setup()
    --     end
    -- }
}
