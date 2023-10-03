return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
          ensure_installed = { "c", "lua", "rust", "python", "latex", "go"},
          sync_install = false,
          highlight = {
            enable = true
          },
          rainbow = {
            enable = true,
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
          },
        })
    end
}
