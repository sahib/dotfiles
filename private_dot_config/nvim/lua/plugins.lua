local fn = vim.fn
local installPath = DATA_PATH..'/site/pack/packer/start/packer.nvim'

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
  -- smooth scrolling on page up/down:
  'psliwka/vim-smoothie',

  -- git integration
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  -- surround vim
  'tpope/vim-surround',

  -- status line
  {
     'nvim-lualine/lualine.nvim',
     dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

  -- show recent files on empty nvim command
  'mhinz/vim-startify',

  -- lsp config
  'neovim/nvim-lspconfig',

  -- for LSP autocompletion
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',

  -- For vsnip users.
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'nvim-tree/nvim-web-devicons',

  -- TODO: prettify telescope vim, make it use regex & shorten the window
  -- telescope - searching / navigation
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  -- better highlighting
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

  -- Split/Join support (gS / gJ)
  'AndrewRadev/splitjoin.vim',

  -- d2 lang highlighting
  'terrastruct/d2-vim',

  -- Use <leader>gh to open current file as github link:
  'ruanyl/vim-gh-line',

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  },

  -- Some Go niceties
  -- https://github.com/ray-x/go.nvim
  'ray-x/go.nvim',
  'ray-x/guihua.lua', -- recommended if need floating window support

  -- nice diagnostic pane on the bottom
  'folke/lsp-trouble.nvim',

  -- better LSP UI (for code actions, rename etc.)
  'glepnir/lspsaga.nvim',

  -- show indentation levels
  'lukas-reineke/indent-blankline.nvim',

  -- Make formatting tabular data easy.
  'godlygeek/tabular',

  -- Show hex colors in the respective background color:
  'norcalli/nvim-colorizer.lua',
  'Glench/Vim-Jinja2-Syntax',

  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- The ":Git" family of commands.
  'tpope/vim-fugitive',

  -- Spellchecking:
  'lewis6991/spellsitter.nvim',

  -- Highlight whitespace errors (and use :FixWhitespace):
  'bronson/vim-trailing-whitespace',

  -- Show lightbulb when code action is available on a line:
  {
    'kosayoda/nvim-lightbulb',
    dependencies = 'antoinemadec/FixCursorHold.nvim',
  },

  -- Make it easy to install new language servers with :Mason
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- mkdir folders on save if they do not exist
  { 'jghauser/mkdir.nvim' },

  -- run tests directly from the editor (using gt and gT)
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go"
    }
  },

  -- Show a nice tabline that takes the colors of lualine:
  {
    'kdheepak/tabline.nvim',
    dependencies = {
        { 'nvim-lualine/lualine.nvim', opt=true },
        { 'nvim-tree/nvim-web-devicons', opt = true},
    }
  },

  -- Colorscheme:
  {
    'projekt0n/github-nvim-theme', tag = 'v0.0.7'
  },

  -- Add twin-bracket when typing [{(
  "windwp/nvim-autopairs",

  -- remember the last edit position in a file:
  'ethanholz/nvim-lastplace',

  -- rainbow colors for nested brackets (((())))
  'mrjones2014/nvim-ts-rainbow',

  -- use ,rn to rename things with lsp
  {
    'filipdutescu/renamer.nvim',
    branch = 'master',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  -- autosave on some events:
  "https://git.sr.ht/~nedia/auto-save.nvim",
  'simrat39/symbols-outline.nvim',
  'gelguy/wilder.nvim',
  'jake-stewart/slide.nvim'

})

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
vim.opt.shortmess :append("c")
vim.opt.shortmess :append("n")
vim.opt.shortmess :append("o")
vim.opt.shortmess :append("I")


-- Fix for needing to press Enter when something was not found in the search.
-- This seems to be a bug due to setting cmdheight=0: https://github.com/neovim/neovim/issues/20380
vim.api.nvim_command("au CmdlineEnter * setlocal cmdheight=1")
vim.api.nvim_command("au CmdlineLeave * call timer_start(1, { tid -> execute('setlocal cmdheight=0')})")

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


-- I often type :W or :Q (because I'm stupid) for saving:
for _, v in ipairs({"W", "Q", "Wq", "WQ"}) do
    vim.api.nvim_create_user_command(v, v:lower(), {})
end


-- Press ",k" or ",j" to go down or up a column of same-colored things.
local slide = require("slide")
vim.keymap.set({"n", "v"}, "<leader>k", slide.up)
vim.keymap.set({"n", "v"}, "<leader>j", slide.down)
