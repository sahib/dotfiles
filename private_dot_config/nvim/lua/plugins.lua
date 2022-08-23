local fn = vim.fn
local installPath = DATA_PATH..'/site/pack/packer/start/packer.nvim'

-- install packer if it's not installed already
local packerBootstrap = nil
if fn.empty(fn.glob(installPath)) > 0 then
  packerBootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', installPath})
  vim.cmd [[packadd packer.nvim]]
end

local packer = require('packer').startup(function(use)
  -- Packer should manage itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use 'shaunsingh/solarized.nvim'

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

  -- nerd commenter
  -- (<Leader>-c<Space>)
  use 'scrooloose/nerdcommenter'

  -- status line
  use 'glepnir/galaxyline.nvim'

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

  -- Use <leader>gh to open current file as github link:
  use 'ruanyl/vim-gh-line'

  -- Make the :Far command available for efficient multi-buffer
  -- replacements.
  use 'brooth/far.vim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- prettier tabs
  use 'romgrk/barbar.nvim'

  -- nice diagnostic pane on the bottom
  use 'folke/lsp-trouble.nvim'

  -- support the missing lsp diagnostic colors
  use 'folke/lsp-colors.nvim'

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

  -- autosave on some events:
  use{ "Pocco81/auto-save.nvim" }

  -- remember the last edit position in a file:
  use { 'ethanholz/nvim-lastplace' }

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
require('plugin-config/barbar')
require('plugin-config/lsp-colors')
require('plugin-config/lsp-trouble')
require('plugin-config/lspsaga')
require('plugin-config/galaxyline')
require('plugin-config/gitsigns')
require('plugin-config/indent-guide-lines')
require('plugin-config/todo-comments')

-- quick setup plugins go here:
require('lspconfig').pyright.setup{}
require('lspconfig').clangd.setup{}
require('lspconfig').sumneko_lua.setup{}
require('lspconfig').rust_analyzer.setup{}
require('lspconfig').gopls.setup{}
require('lspconfig').elmls.setup{}
require('lspconfig').tsserver.setup{}
require('lspconfig').bashls.setup{}
require('colorizer').setup()
require('spellsitter').setup {
  enable = true,
}
require('nvim-lightbulb').setup({autocmd = {enabled = true}})
require("mason").setup()

require("neotest").setup({
  adapters = {
    require("neotest-go")({}),
  },
})
require("auto-save").setup({
  -- See ":h events" for a complete list.
  -- "TextChanged" might present an issue if you have many autocmds for save.
  trigger_events = {"InsertLeave", "TextChanged", "FocusLost"},
  -- Minimum time between saves:
  debounce_delay = 2500
})
require('nvim-lastplace').setup{}
