-- status line
return {
  {
     'nvim-lualine/lualine.nvim',
     dependencies = { 'nvim-tree/nvim-web-devicons' },
     config = function()
        -- Status line and tabline::
        vim.o.laststatus = 3

        require('lualine').setup({
            options = {
                component_separators = '|',
                section_separators = { left = '', right = '' },
            }
        })
        require'tabline'.setup({})

        -- Navigate easily through tabs:
        local opts = {noremap = true, silent = true}
        vim.api.nvim_set_keymap('', '<C-A-Left>',  '<Cmd>TablineBufferPrevious<CR>', opts)
        vim.api.nvim_set_keymap('', '<C-A-Right>', '<Cmd>TablineBufferNext<CR>', opts)
        vim.api.nvim_set_keymap('', '<C-A-q>',     '<Cmd>bdelete<CR>', opts)

        -- disable normal command prompt and use wilder:
        vim.o.cmdheight = 0
        vim.opt.shortmess:append("c")
        vim.opt.shortmess:append("n")
        vim.opt.shortmess:append("o")
        vim.opt.shortmess:append("I")

        -- Fix for needing to press Enter when something was not found in the search.
        -- This seems to be a bug due to setting cmdheight=0: https://github.com/neovim/neovim/issues/20380
        vim.api.nvim_command("au CmdlineEnter * setlocal cmdheight=1")
        vim.api.nvim_command("au CmdlineLeave * call timer_start(1, { tid -> execute('setlocal cmdheight=0')})")
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
