-- status line
return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'kdheepak/tabline.nvim',

            -- Needed because colorscheme should be loaded first:
            'projekt0n/github-nvim-theme',
        },
        config = function()
            -- Status line:
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

            local theme_spec = require('github-theme.spec').load('github_light')
            require('lualine').setup({
                options = {
                    component_separators = '|',
                    section_separators = { left = '', right = '' },
                    globalstatus = true,
                    disabled_filetypes = { 'NVimTree', 'startup' }
                },
                sections = {
                    lualine_b = { {'diff', source = diff_source}, },
                    lualine_c = {
                        {
                            'diagnostics',
                            sources = { 'nvim_diagnostic' },
                            symbols = { error = ' ', warn = ' ', info = ' ' },
                            diagnostics_color = {
                              color_error = { fg = theme_spec.diag.error },
                              color_warn = { fg = theme_spec.diag.warn },
                              color_info = { fg = theme_spec.diag.info },
                            },
                        },
                        'searchcount',
                        'selectioncount',
                    }
                }
            })

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
    {
        "tiagovla/scope.nvim",
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function ()
            require("scope").setup({})
            require("telescope").load_extension("scope")
            --
            -- Navigate easily through tabs:
            vim.api.nvim_set_keymap('', '<Leader>b', '<Cmd>Telescope scope buffers<CR>', { desc = "List buffers" })
            vim.api.nvim_set_keymap('', '<C-A-Left>', '<Cmd>tabprevious<CR>', { desc = "Go to tab left" })
            vim.api.nvim_set_keymap('', '<C-A-Right>', '<Cmd>tabnext<CR>', { desc = "Go to tab right" })
            vim.api.nvim_set_keymap('', '<C-A-q>', '<Cmd>tabclose<CR>', { desc = "Close current buffer" })

        end
    },
}
