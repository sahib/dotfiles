local lualine_theme = function()
  local theme_spec = require("github-theme.spec").load(vim.g.colors_name)
  local C = require("github-theme.lib.color")
  local function blend(color, a)
    return C(theme_spec.bg1):blend(C(color), a):to_css()
  end

  local p = theme_spec.palette
  local tint = function(color)
    return {
      a = { bg = theme_spec.bg1, fg = color },
      b = { bg = theme_spec.bg1, fg = p.black.base },
      c = { bg = theme_spec.bg1, fg = p.black.base },
    }
  end

  local inactive_hi = { bg = theme_spec.bg0, fg = blend(theme_spec.fg1, 0.3) }

  -- Fix for https://github.com/projekt0n/github-nvim-theme/issues/175
  vim.cmd("hi! link StatusLine Normal")

  return {
    normal = tint(p.blue.base),
    insert = tint(p.green.base),
    command = tint(p.magenta.bright),
    visual = tint(p.yellow.base),
    replace = tint(p.red.base),
    terminal = tint(p.orange),
    inactive = {
      a = inactive_hi,
      b = inactive_hi,
      c = inactive_hi,
    },
  }
end

-- Make the statusline  less instrusive color wise so it does not
-- steal focus  from the contents.
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      -- Needed because colorscheme should be loaded first:
      "projekt0n/github-nvim-theme",
    },
    event = "VeryLazy",
    opts = {
      options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = { "NVimTree", "startup" },
        theme = lualine_theme,
      },
    },
  },
}
