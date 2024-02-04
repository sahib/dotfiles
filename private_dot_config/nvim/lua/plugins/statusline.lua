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
        event = "VimEnter",
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


            local theme_spec = require('github-theme.spec').load(vim.g.colors_name)

            -- This is an adjusted version of the github-theme's lualine config:
            local lualine_theme = function()
                local theme_spec = require('github-theme.spec').load(vim.g.colors_name)
                local C = require('github-theme.lib.color')
                local function blend(color, a)
                    return C(theme_spec.bg1):blend(C(color), a):to_css()
                end

                local p = theme_spec.palette
                local tint = function(color)
                    return {
                        a = { bg = theme_spec.bg1, fg = color },
                        b = { bg = theme_spec.bg1, fg = p.black.base },
                        c = { bg = theme_spec.bg1, fg = p.black.base },
                    }
                end

                local inactive_hi = { bg = theme_spec.bg0, fg = blend(theme_spec.fg1, 0.3) }

                -- Fix for https://github.com/projekt0n/github-nvim-theme/issues/175
                vim.cmd('hi! link StatusLine Normal')

                return {
                    normal = tint(p.blue.base),
                    insert = tint(p.green.base),
                    command = tint(p.magenta.bright),
                    visual = tint(p.yellow.base),
                    replace = tint(p.red.base),
                    terminal = tint(p.orange),
                    inactive = {
                        a = inactive_hi,
                        b = inactive_hi,
                        c = inactive_hi,
                    },
                }
            end

            require('lualine').setup({
                options = {
                    component_separators = '',
                    section_separators = { left = '', right = '' },
                    globalstatus = true,
                    disabled_filetypes = { 'NVimTree', 'startup' },
                    theme = lualine_theme,
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
