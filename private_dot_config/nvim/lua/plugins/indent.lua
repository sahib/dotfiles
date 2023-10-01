local highlight = {
    "Grey1",
    "Grey2",
    "Grey3",
    "Grey4",
    "Grey5",
    "Grey6",
    "Grey7",
}

-- show indentation levels
return {
   'lukas-reineke/indent-blankline.nvim',
   main = "ibl",
   opts = {},
   lazy = false,
   config = function()
        local hooks = require "ibl.hooks"

        -- This lets the indent lines be more visible the more nested
        -- a piece of code is. The first Grey is the leftmost one.
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "Grey1", { fg = "#EEEEEE" })
            vim.api.nvim_set_hl(0, "Grey2", { fg = "#DDDDDD" })
            vim.api.nvim_set_hl(0, "Grey3", { fg = "#CCCCCC" })
            vim.api.nvim_set_hl(0, "Grey4", { fg = "#BBBBBB" })
            vim.api.nvim_set_hl(0, "Grey5", { fg = "#AAAAAA" })
            vim.api.nvim_set_hl(0, "Grey6", { fg = "#999999" })
            vim.api.nvim_set_hl(0, "Grey7", { fg = "#888888" })
        end)


        hooks.register(
          hooks.type.WHITESPACE,
          hooks.builtin.hide_first_space_indent_level
        )

        require("ibl").setup({
            indent = {
                char = '⎸',
                tab_char = '⎸',
                highlight = highlight,
            },
            exclude = {
                filetypes = {'text', 'markdown', 'help', 'startify', 'NvimTree'},
                buftypes = {'startify', 'NvimTree'},
            },
            scope = {
                enabled = true,
                show_start = true,
                show_end = true,
                char = '⎸',
                highlight = highlight,
            },
            whitespace = {
                highlight = highlight,
            },
        })
   end,
}
