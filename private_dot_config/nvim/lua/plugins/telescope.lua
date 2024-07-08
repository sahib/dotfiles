return {
  -- Overwrite some telescope mappins so that the window
  -- closes immediately when pressing Esc.
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "folke/trouble.nvim" },
    opts = {
      defaults = {
        mappings = {
          i = {
            -- Exit immediately when hitting ESC
            -- (this basically disables normal mode)
            ["<esc>"] = require("telescope.actions").close,

            -- Send contents to trouble window
            ["<c-s>"] = require("trouble.sources.telescope").open,
          },
          n = {
            -- Send contents to trouble window
            ["<c-s>"] = require("trouble.sources.telescope").open,
          },
        },
      },
    },
  },
}
