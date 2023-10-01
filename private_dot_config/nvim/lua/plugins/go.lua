return {
    {
       -- Some Go niceties
       'ray-x/go.nvim',
       dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
       },
       config = function()
           -- do format and import on save:
            local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
              pattern = "*.go",
              callback = function()
               require('go.format').goimport()
              end,
              group = format_sync_grp,
            })

            require("go").setup()
       end,
       event = {"CmdlineEnter"},
       ft = {"go", 'gomod'},
       build = ':lua require("go.install").update_all_sync()'
    },
}
