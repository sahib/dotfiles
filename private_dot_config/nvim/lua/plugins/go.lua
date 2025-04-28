return {

  {
    -- Show coverage output directly in Go:
    "rafaelsq/nvim-goc.lua",
    config = function()
      -- if set, when we switch between buffers, it will not split more than once. It will switch to the existing buffer instead
      vim.opt.switchbuf = "useopen"

      local goc = require("nvim-goc")
      goc.setup({ verticalSplit = false }) -- default to horizontal

      vim.keymap.set("n", "<Leader>gcf", goc.Coverage, { desc = "Show coverage for file", silent = true })
      vim.keymap.set("n", "<Leader>gct", goc.CoverageFunc, { desc = "Show coverage for test", silent = true })
      vim.keymap.set("n", "<Leader>gcc", goc.ClearCoverage, { desc = "Clear coverage", silent = true })
    end,
  },
  {
    "fredrikaverpil/godoc.nvim",
    version = "*",
    dependencies = {
      { "nvim-telescope/telescope.nvim" }, -- optional
      { "folke/snacks.nvim" }, -- optional
      { "echasnovski/mini.pick" }, -- optional
      { "ibhagwan/fzf-lua" }, -- optional
      {
        "nvim-treesitter/nvim-treesitter",
        opts = {
          ensure_installed = { "go" },
        },
      },
    },
    build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
    cmd = { "GoDoc" }, -- optional
    opts = {
      picker = {
        type = "snacks",
      },
    },
  },
}
