return {

  -- Disable neotree because we have oil.nvim
  -- (which is way less annoying)
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  -- I don't really need tabs and manage buffers with
  -- telescope rather.
  {
    "akinsho/bufferline.nvim",
    enabled = true,
  },
}
