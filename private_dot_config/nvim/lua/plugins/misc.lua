return {
    -- smooth scrolling on page up/down:
    {
        'psliwka/vim-smoothie',
    },
    -- Neovim lua development:
    -- This makes it possible to edit the lua config
    -- without getting tons of syntax errors.
    {
        "folke/neodev.nvim",
        opts = {},
        config = function()
            require("neodev").setup({
                library = {
                    plugins = { "nvim-dap-ui" },
                    types = true,
                },
            })
        end
    },
    -- show recent files on empty nvim command.
    {
        'nvimdev/dashboard-nvim',
        dependencies = { {'nvim-tree/nvim-web-devicons'}},
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                shortcut_type = 'number',
                change_to_vcs_root = true,
                config = {
                    week_header = {
                        enable = true,
                    },
                    project = {
                        enable = false,
                    },
                    shortcut = {
                        {
                            desc = '󰊳 Update',
                            action = 'Lazy update',
                            group = 'Label',
                            key = 'u',
                        },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Config',
                            group = 'Label',
                            action = 'cd ~/.config/nvim/lua/plugins | e .',
                            key = 'c',
                        },
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        {
                            icon = ' ',
                            desc = 'Search',
                            icon_hl = '@variable',
                            group = 'Label',
                            action = 'Telescope live_grep',
                            key = 'g',
                        },
                        {
                            icon = ' ',
                            desc = 'Quit',
                            icon_hl = '@variable',
                            group = 'Label',
                            action = 'q',
                            key = 'q',
                        },
                        {
                            icon = '🆕 ',
                            desc = 'New buffer',
                            icon_hl = '@variable',
                            group = 'Label',
                            action = 'enew',
                            key = 'e',
                        },
                    },
                },
            }
        end,
    },
    -- Split/Join support (gS / gJ)
    {
        'Wansmer/treesj',
        event = "VeryLazy",
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({
                use_default_keymaps = false,
            })

            local api = require('treesj')
            vim.keymap.set('n', 'gm', api.toggle)
            vim.keymap.set('n', 'gs', api.split)
            vim.keymap.set('n', 'gj', api.join)
            vim.keymap.set('n', 'gM', function()
                api.toggle({ split = { recursive = true } })
            end)
            vim.keymap.set('n', 'gS', function()
                api.split({ split = { recursive = true } })
            end)
            vim.keymap.set('n', 'gJ', function()
                api.join({ split = { recursive = true } })
            end)
        end,
    },
    -- Make formatting tabular data easy using the :Tabularize command.
    -- Aligns tables based on regular expressions
    {
        'godlygeek/tabular',
    },
    -- Show hex colors in the respective background color:
    -- Example for warning, if enabled you see it colored: #FF00FF
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require("colorizer").setup()
        end
    },
    -- Provide a buffer where we can evaluate some basic math
    -- Just type :Quickmath (or ,m) and the current buffer
    -- will be treated as lua script where each line is evaluated and shown
    -- right of it.
    {
        'jbyuki/quickmath.nvim',
        config = function()
            vim.api.nvim_set_keymap('', '<leader>m', '<Cmd>tabnew | :Quickmath<CR>', {
                desc = "Do quick math",
            })
        end
    },
    -- Highlight whitespace errors (and use :FixWhitespace):
    {
        'bronson/vim-trailing-whitespace',
    },
    -- mkdir folders on save if they do not exist
    {
        'jghauser/mkdir.nvim'
    },
    -- Add twin-bracket when typing [{(
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    -- remember the last edit position in a file:
    {
        'vladdoster/remember.nvim',
        config = function()
            require('remember').setup({})
        end
    },
    -- Highlight TODO: and NOTE: comments.
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup()
        end,
    },
    -- autosave on some events:
    {
        "https://git.sr.ht/~nedia/auto-save.nvim",
        config = function()
            require("auto-save").setup()
        end
    },
    -- Toggle comment status of a selection with `gc`
    {
        "terrortylor/nvim-comment",
        config = function()
            require('nvim_comment').setup()
        end
    },
    -- This plugin is a dependency to noice.
    -- Configure the notifications to lower right corner.
    {
        "rcarriga/nvim-notify",
        config = function()
            require('notify').setup({
                level = vim.log.levels.INFO,
                timeout = 25,
                render = 'compact',
                stages = 'fade',
                top_down = false,
            })
        end
    },
    -- Change the UI for the cmdline, popups and search
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            local noice = require('noice')
            noice.setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                    hover = {
                        enabled = false,
                    },
                },
                notify = {
                    enabled = true,
                    view = 'virtualtext',
                },
                -- you can enable a preset for easier configuration
                presets = {
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    lsp_doc_border = true,        -- add a border to hover docs and signature help
                },
            })

            -- Dismiss notifications if they're too annoying.
            vim.keymap.set('n', '<Leader>c', function() noice.cmd('dismiss') end, {
                silent = true,
                desc = "Dismiss notifications",
            })
        end,
    },
    -- Show a help for the key if not pressed fast enough:
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 800
        end,
        opts = {
            window = {
                border = 'single',
            }
        }
    },
    -- Support for typst syntax:
    {
        'kaarmu/typst.vim',
        ft = 'typst',
        lazy = false,
    },
    {
        -- Use 'ga' (no preview) or 'gA' (with preview)
        -- to align text easily using a pattern.
        'echasnovski/mini.align',
        version = false,
        config = true,
    },
    -- Jump between alternative files (i.e. test and implementation) using <leader>a
    {
        'rgroli/other.nvim',
        config = function ()
            require("other-nvim").setup({
                mappings = {
                    "golang",
                    -- {
                    --     context = "header",
                    --     pattern = "(.*).c*$",
                    --     target = "%1h",
                    -- },
                    -- {
                    --     context = "implementation",
                    --     pattern = "(.*).h$",
                    --     target = "%1.c",
                    -- },
                },
            })

            vim.keymap.set('n', '<Leader>a', '<Cmd>Other<CR>', { silent = true, desc = 'Go to test file or back' })
        end
    },
    -- Jump easily to a label during searching or directly filter or select with s / S
    {
          "folke/flash.nvim",
          event = "VeryLazy",
          opts = {},
          keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter_search() end, desc = "Flash Treesitter Search" },
          },
    },
    -- Make it easy to surround things with quotes, parantheses or other tags.
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
}
