return {
  -- add the github theme
  {
    "projekt0n/github-nvim-theme",
  },

  -- Configure LazyVim to load the current colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_light",
    },
  },

  {
    "https://git.sr.ht/~swaits/colorsaver.nvim",
    dependencies = {
      "projekt0n/github-nvim-theme",
    },
    event = "VimEnter",
    opts = {
      -- This will make sure to save the colorscheme that we used last
      -- is used in new sessions and also synchronized to other nvims.
      auto_load = true,
      -- The file where the above info is persisted to.
      filename = "colorsaver",
    },
  },
}
