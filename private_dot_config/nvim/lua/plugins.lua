local fn = vim.fn
local installPath = DATA_PATH..'/site/pack/packer/start/packer.nvim'

-- install packer if it's not installed already
local packerBootstrap = nil
if fn.empty(fn.glob(installPath)) > 0 then
  packerBootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', installPath})
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Packer should manage itself
  use 'wbthomason/packer.nvim'

  -- smooth scrolling on page up/down:
  use 'psliwka/vim-smoothie'

  -- git integration
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  -- surround vim
  use 'tpope/vim-surround'

  -- status line
  use {
     'nvim-lualine/lualine.nvim',
     requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- show recent files on empty nvim command
  use 'mhinz/vim-startify'

  -- lsp config
  use 'neovim/nvim-lspconfig'

  -- for LSP autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'nvim-tree/nvim-web-devicons'

  -- TODO: prettify telescope vim, make it use regex & shorten the window
  -- telescope - searching / navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- better highlighting
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

  -- Split/Join support (gS / gJ)
  use 'AndrewRadev/splitjoin.vim'

  -- d2 lang highlighting
  use 'terrastruct/d2-vim'

  -- Use <leader>gh to open current file as github link:
  use 'ruanyl/vim-gh-line'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- Some Go niceties
  -- https://github.com/ray-x/go.nvim
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommended if need floating window support

  -- nice diagnostic pane on the bottom
  use 'folke/lsp-trouble.nvim'

  -- better LSP UI (for code actions, rename etc.)
  use 'glepnir/lspsaga.nvim'

  -- show indentation levels
  use 'lukas-reineke/indent-blankline.nvim'

  -- Make formatting tabular data easy.
  use 'godlygeek/tabular'

  -- Show hex colors in the respective background color:
  use 'norcalli/nvim-colorizer.lua'
  use 'Glench/Vim-Jinja2-Syntax'

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  -- The ":Git" family of commands.
  use 'tpope/vim-fugitive'

  -- Spellchecking:
  use 'lewis6991/spellsitter.nvim'

  -- Highlight whitespace errors (and use :FixWhitespace):
  use 'bronson/vim-trailing-whitespace'

  -- Show lightbulb when code action is available on a line:
  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  }

  -- Make it easy to install new language servers with :Mason
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }

  -- mkdir folders on save if they do not exist
  use { 'jghauser/mkdir.nvim' }

  -- run tests directly from the editor (using gt and gT)
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go"
    }
  }

  -- Show a nice tabline that takes the colors of lualine:
  use {
    'kdheepak/tabline.nvim',
    requires = {
        { 'nvim-lualine/lualine.nvim', opt=true },
        { 'nvim-tree/nvim-web-devicons', opt = true},
    }
  }

  -- Colorscheme:
  use({
    'projekt0n/github-nvim-theme', tag = 'v0.0.7'
  })

  -- Add twin-bracket when typing [{(
  use{ "windwp/nvim-autopairs" }

  -- remember the last edit position in a file:
  use { 'ethanholz/nvim-lastplace' }

  -- rainbow colors for nested brackets (((())))
  use { 'mrjones2014/nvim-ts-rainbow' }

  -- use ,rn to rename things with lsp
  use {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- autosave on some events:
  use {
    "https://git.sr.ht/~nedia/auto-save.nvim",
  }

  use 'simrat39/symbols-outline.nvim'

  use {
  'gelguy/wilder.nvim',
  config = function()
    -- config goes here
  end,
}

  -- this will automatically install listed dependencies
  -- only the first time NeoVim is opened, because that's when Packer gets installed
  if packerBootstrap then
    require('packer').sync()
  end
end)

-- plugin specific configs go here
require('plugin-config/nvim-cmp')
require('plugin-config/telescope')
require('plugin-config/nvim-tree')
require('plugin-config/nvim-treesitter')
require('plugin-config/lsp-trouble')
require('plugin-config/lspsaga')
require('plugin-config/gitsigns')
require('plugin-config/indent-guide-lines')
require('plugin-config/todo-comments')

require("mason").setup()
require("mason-lspconfig").setup()

-- quick setup plugins go here:
require('lspconfig').pyright.setup{}
require('lspconfig').clangd.setup{}
require('lspconfig').lua_ls.setup{}
require('lspconfig').rust_analyzer.setup{}
require('lspconfig').gopls.setup{}
require('lspconfig').elmls.setup{}
require('lspconfig').tsserver.setup{}
require('lspconfig').bashls.setup{}
require('colorizer').setup()
require('go').setup()
require("nvim-autopairs").setup{}
require('nvim-web-devicons').setup{}
require('spellsitter').setup {
  enable = true,
}
require('nvim-lightbulb').setup({autocmd = {enabled = true}})

vim.opt.list = true

-- Show tab indicators, line depth and some more:
require("indent_blankline").setup {
    show_end_of_line = false,
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
}

require("neotest").setup({
  adapters = {
    require("neotest-go")({}),
  },
})
require('nvim-lastplace').setup{}

-- Github colorscheme:
vim.opt.termguicolors = true
require('github-theme').setup({
    dark_sidebar = true,
    dark_float = true,
})
vim.cmd('colorscheme github_light')

-- Status line and tabline::
vim.o.laststatus = 3
require('lualine').setup({
    options = {
        component_separators = '|',
        section_separators = { left = '', right = '' },
    }
})
require'tabline'.setup({})

-- This makes the status line global (i.e. not one status line per window)

-- Navigate easily through tabs:
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('', '<C-A-Left>',  '<Cmd>TablineBufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('', '<C-A-Right>', '<Cmd>TablineBufferNext<CR>', opts)
vim.api.nvim_set_keymap('', '<C-A-q>',     '<Cmd>bdelete<CR>', opts)

require('renamer').setup {}
vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

require("auto-save").setup()

-- disable normal command prompt and use wilder:
vim.o.cmdheight = 0
wilder = require("wilder")
local gradient = {
  '#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
  '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
  '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
  '#c8d43a', '#bfde43', '#b6e84e', '#aff05b'
}

for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu', {{a = 1}, {a = 1}, {foreground = fg}})
end
require('wilder').setup({modes = {':'}})
require('wilder').set_option('renderer',
    wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
            -- 'single', 'double', 'rounded' or 'solid'
            -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
            border = 'rounded',
            max_height = '75%',      -- max height of the palette
            min_height = 0,          -- set to the same as 'max_height' for a fixed height window
            prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
            reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
            left = {' ', wilder.popupmenu_devicons()},
            right = {' ', wilder.popupmenu_scrollbar()},
            highlights = {
                gradient = gradient,
            },
            highlighter = wilder.highlighter_with_gradient({
                wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
            }),
        })
    )
)

vim.keymap.set('n', '<leader>a', '<cmd>SymbolsOutline<CR>')
require("symbols-outline").setup({
    preview_bg_highlight = "#000000"
})
