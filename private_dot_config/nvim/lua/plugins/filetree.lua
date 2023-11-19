return {
    -- oil.nvim: open current dir as editable buffer with `-`
    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            oil_api = require('oil')
            oil_api.setup({
                view_options = {
                    show_hidden = true,
                },
                columns = {
                    "icon",
                    "size",
                    -- "permissions",
                    -- "mtime",
                },
            })

            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

            -- Open the current buffers parent dir (or cwd if not known):
            vim.keymap.set('n', '<leader>n', function()
                oil_api.open(nil)
            end, {
                silent = true,
                noremap = true,
                desc = 'Toggle file browser',
            })
        end
    },
}
