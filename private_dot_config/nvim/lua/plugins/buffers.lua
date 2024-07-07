return {
  {
    "tiagovla/scope.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("scope").setup({})
      require("telescope").load_extension("scope")

      -- Navigate easily through tabs:
      vim.api.nvim_set_keymap("", "<Leader>B", "<Cmd>Telescope scope buffers<CR>", { desc = "List buffers" })
      vim.api.nvim_set_keymap("", "<C-A-Left>", "<Cmd>tabprevious<CR>", { desc = "Go to tab left" })
      vim.api.nvim_set_keymap("", "<C-A-Right>", "<Cmd>tabnext<CR>", { desc = "Go to tab right" })
      vim.api.nvim_set_keymap("", "<C-A-q>", "<Cmd>tabclose<CR>", { desc = "Close current buffer" })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<Leader>sQ", builtin.grep_string, { desc = "Find string under cursor" })
    end,
  },
}
