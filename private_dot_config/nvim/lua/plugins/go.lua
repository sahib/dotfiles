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
}
