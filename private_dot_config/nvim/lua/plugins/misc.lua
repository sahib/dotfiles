-- TODO: Disable neotree
-- TODO: Support for visual treesitter select.
return {
  -- show recent files on empty nvim command.
  -- Split/Join support (gS / gJ)
  {
    "Wansmer/treesj",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })

      local api = require("treesj")
      vim.keymap.set("n", "gm", api.toggle)
      vim.keymap.set("n", "gs", api.split)
      vim.keymap.set("n", "gj", api.join)
      vim.keymap.set("n", "gM", function()
        api.toggle({ split = { recursive = true } })
      end)
      vim.keymap.set("n", "gS", function()
        api.split({ split = { recursive = true } })
      end)
      vim.keymap.set("n", "gJ", function()
        api.join({ split = { recursive = true } })
      end)
    end,
  },

  -- Make formatting tabular data easy using the :Tabularize command.
  -- Aligns tables based on regular expressions
  {
    "godlygeek/tabular",
  },

  -- Show hex colors in the respective background color:
  -- Example for warning, if enabled you see it colored: #FF00FF
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  -- Provide a buffer where we can evaluate some basic math
  -- Just type :Quickmath (or ,m) and the current buffer
  -- will be treated as lua script where each line is evaluated and shown
  -- right of it.
  {
    "jbyuki/quickmath.nvim",
    config = function()
      vim.api.nvim_set_keymap("", "<leader>m", "<Cmd>tabnew | :Quickmath<CR>", {
        desc = "Do quick math",
      })
    end,
  },

  -- Highlight whitespace errors (and use :FixWhitespace):
  {
    "bronson/vim-trailing-whitespace",
  },

  -- mkdir folders on save if they do not exist
  {
    "jghauser/mkdir.nvim",
  },

  -- autosave on some events (like leaving the window)
  {
    "https://git.sr.ht/~nedia/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },

  -- Support for typst syntax:
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
  },

  {
    -- Use 'ga' (no preview) or 'gA' (with preview)
    -- to align text easily using a pattern.
    "echasnovski/mini.align",
    version = false,
    config = true,
  },

  -- Jump between alternative files (i.e. test and implementation) using <leader>a
  {
    "rgroli/other.nvim",
    config = function()
      require("other-nvim").setup({
        mappings = {
          "golang",
        },
      })

      vim.keymap.set("n", "<Leader>a", "<Cmd>Other<CR>", { silent = true, desc = "Go to test file or back" })
    end,
  },
  {
    "zk-org/zk-nvim",
    config = function()
      require("zk").setup({
        picker = "fzf_lua",
      })
    end,
  },
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "1.*",
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  },
}
