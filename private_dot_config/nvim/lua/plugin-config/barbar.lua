-- tab movement
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('', '<C-A-Left>',  '<Cmd>BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('', '<C-A-Right>', '<Cmd>BufferNext<CR>', opts)
vim.api.nvim_set_keymap('', '<C-A-q>',     '<Cmd>BufferClose<CR>', opts)

local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_state.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_state.set_offset(0)
end)

require'bufferline'.setup {
    icon_close_tab='×'
}
