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
    -- show recent files on empty nvim command
    -- and show nice fortunes on startup.
    {
        'mhinz/vim-startify',
    },
    -- Split/Join support (gS / gJ)
    {
        'AndrewRadev/splitjoin.vim',
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
        config = function ()
            vim.api.nvim_set_keymap('', '<leader>m',  '<Cmd>tabnew | :Quickmath<CR>', {
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
                -- you can enable a preset for easier configuration
                presets = {
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    lsp_doc_border = true,        -- add a border to hover docs and signature help
                },
            })

            -- Dismiss notifications if they're too annoying.
            vim.keymap.set('n', '<Leader>cc', function() noice.cmd('dismiss') end, {
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
        vim.o.timeoutlen = 300
      end,
      opts = {
          window = {
              border = 'single',
          }
      }
    },
}
