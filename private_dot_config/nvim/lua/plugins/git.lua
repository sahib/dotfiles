return {
  -- Integration for lazygit (external program).
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.keymap.set("", "<leader>G", "<Cmd>:LazyGit<CR>", { desc = "Open LazyGit" })
    end,
  },

  -- Use <leader>gh to open current file as github link:
  {
    "ruanyl/vim-gh-line",
  },
}
