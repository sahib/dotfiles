return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            -- This plugin gives us smarter textobjects,
            -- usable with "v." or "vi." - they increment the more keystrokes are used.
            'RRethy/nvim-treesitter-textsubjects',
        },
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")
            configs.setup({
                ensure_installed = { "c", "lua", "rust", "python", "latex", "go" },
                sync_install = false,
                highlight = {
                    enable = true
                },
                rainbow = {
                    enable = true,
                    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                    max_file_lines = nil, -- Do not enable for files with more than n lines, int
                },
                textsubjects = {
                    enable = true,
                    prev_selection = ',', -- (Optional) keymap to select the previous selection
                    keymaps = {
                        ['.'] = 'textsubjects-smart',
                        [';'] = 'textsubjects-container-outer',
                        ['i;'] = 'textsubjects-container-inner',
                        ['i;'] = { 'textsubjects-container-inner', desc =
                        "Select inside containers (classes, functions, etc.)" },
                    },
                }
            })
        end,
    },
}
