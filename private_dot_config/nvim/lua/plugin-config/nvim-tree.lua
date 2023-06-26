local opts = {silent = true, noremap = true}
vim.api.nvim_set_keymap('n', '<C-n>', '<Cmd>NvimTreeFindFileToggle<CR>', opts)

-- find the currently open file in tree
vim.api.nvim_set_keymap('n', '<leader>n', '<Cmd>NvimTreeFindFile<CR>', opts)

-- local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- local list = {
--   { key = "<C-t>", cb = tree_cb("tabnew") },
--   { key = "<CR>", cb = tree_cb("edit") },
--   { key = "o", cb = tree_cb("edit") },
--   { key = "<2-LeftMouse>", cb = tree_cb("edit") },
--   { key = "<2-RightMouse>", cb = tree_cb("cd") },
--   { key = "<Tab>", cb = tree_cb("preview") },
--   { key = "R", cb = tree_cb("refresh") },
--   { key = "a", cb = tree_cb("create") },
--   { key = "d", cb = tree_cb("remove") },
--   { key = "r", cb = tree_cb("rename") },
--   { key = "x", cb = tree_cb("cut") },
--   { key = "y", cb = tree_cb("copy") },
--   { key = "p", cb = tree_cb("paste") },
--   { key = "<", cb = tree_cb("dir_up") },
--   { key = "q", cb = tree_cb("close") }
-- }
--

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'O', '', { buffer = bufnr })
  vim.keymap.del('n', 'O', { buffer = bufnr })
  vim.keymap.set('n', '<2-RightMouse>', '', { buffer = bufnr })
  vim.keymap.del('n', '<2-RightMouse>', { buffer = bufnr })
  vim.keymap.set('n', 'D', '', { buffer = bufnr })
  vim.keymap.del('n', 'D', { buffer = bufnr })
  vim.keymap.set('n', 'E', '', { buffer = bufnr })
  vim.keymap.del('n', 'E', { buffer = bufnr })

  vim.keymap.set('n', 'A', api.tree.expand_all, opts('Expand All'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'P', function()
    local node = api.tree.get_node_under_cursor()
    print(node.absolute_path)
  end, opts('Print Node Path'))

  vim.keymap.set('n', 'Z', api.node.run.system, opts('Run System'))
end

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    hide_root_folder = false,
    side = 'left',
  },
  on_attach = on_attach,
  actions = {
      open_file = {
        resize_window = false
      }
  }
}
