return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
    { "onsails/lspkind.nvim" },
    { "lukas-reineke/lsp-format.nvim",
      opts = {
          -- the go plugin takes that over
          -- and does some things like autoimports.
          go = {
              exclude = { "gopls" }
          },
      },
    },
    {
       "folke/trouble.nvim",
       dependencies = { "nvim-tree/nvim-web-devicons" },
       config = function()
        local opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>TroubleToggle<CR>', opts)
        vim.api.nvim_set_keymap('n', '<leader>xq', '<cmd>TroubleToggle quickfix<CR>', opts)
       end,
    },
    {
        'ray-x/navigator.lua',
        requires = {
            { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
            { 'neovim/nvim-lspconfig' },
        },
        config = function ()
            require('navigator').setup()
        end,
    },
}
