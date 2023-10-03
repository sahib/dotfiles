-- status line
return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            -- Status line and tabline:
            vim.o.laststatus = 3

            local function diff_source()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed
                }
              end
            end

            require('lualine').setup({
                options = {
                    component_separators = '|',
                    section_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_b = { {'diff', source = diff_source}, },
                }
            })
            require('tabline').setup({})

            -- Navigate easily through tabs:
            vim.api.nvim_set_keymap('', '<C-A-Left>', '<Cmd>TablineBufferPrevious<CR>', { desc = "Go to tab left" })
            vim.api.nvim_set_keymap('', '<C-A-Right>', '<Cmd>TablineBufferNext<CR>', { desc = "Go to tab right" })
            vim.api.nvim_set_keymap('', '<C-A-q>', '<Cmd>bdelete<CR>', { desc = "Close current buffer" })

            -- This can be enabled again when not using noice anymore. It sets the cmdline height to 0
            -- for a slimmer appearance.
            --
            -- disable normal command prompt and use wilder:
            -- vim.o.cmdheight = 0
            -- vim.opt.shortmess:append("c")
            -- vim.opt.shortmess:append("n")
            -- vim.opt.shortmess:append("o")
            -- vim.opt.shortmess:append("I")

            -- -- Fix for needing to press Enter when something was not found in the search.
            -- -- This seems to be a bug due to setting cmdheight=0: https://github.com/neovim/neovim/issues/20380
            -- vim.api.nvim_command("au CmdlineEnter * setlocal cmdheight=1")
            -- vim.api.nvim_command("au CmdlineLeave * call timer_start(1, { tid -> execute('setlocal cmdheight=0')})")
        end,
    },
    -- Show a nice tabline that takes the colors of lualine:
    {
        'kdheepak/tabline.nvim',
        dependencies = {
            { 'nvim-lualine/lualine.nvim' },
            { 'nvim-tree/nvim-web-devicons' },
        }
    },
}
