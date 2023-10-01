return {
  -- smooth scrolling on page up/down:
  {
      'psliwka/vim-smoothie',
  },
  -- Neovim lua development:
  {
      "folke/neodev.nvim",
      opts = {},
      setup = function ()
        require("neodev").setup({
            library = {
                plugins = { "nvim-dap-ui" },
                types = true,
            },
        })
      end
  },
  -- show recent files on empty nvim command
  -- and show nice fortunes.
  {
      'mhinz/vim-startify',
  },
  -- Split/Join support (gS / gJ)
  {
      'AndrewRadev/splitjoin.vim',
  },
  -- Make formatting tabular data easy using the :Tabularize command.
  {
      'godlygeek/tabular',
  },
  -- Show hex colors in the respective background color:
  {
      'norcalli/nvim-colorizer.lua',
      config = function ()
        require("colorizer").setup()
      end
  },
  -- Provide a buffer where we can evaluate some basic math
  {
      'jbyuki/quickmath.nvim', -- TODO: Provide a shortcut for a hover window or split.
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
      'ethanholz/nvim-lastplace',
      config = function()
        require('nvim-lastplace').setup()
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
    config = function ()
        require("auto-save").setup()
    end
  },
  -- Toggle comment status of a selection with `gcc`
  {
      "terrortylor/nvim-comment",
      config = function ()
        require('nvim_comment').setup()
      end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
   },
   config = function ()
    require("noice").setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    })
   end
}
