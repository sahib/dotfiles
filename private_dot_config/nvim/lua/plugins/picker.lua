return {
  "ibhagwan/fzf-lua",
  config = function()
    local fzf = require("fzf-lua")
    local troubleFzf = require("trouble.sources.fzf")
    local trouble = require("trouble")

    local config = require("fzf-lua.config")
    local actions = troubleFzf.actions
    config.defaults.actions.files["ctrl-t"] = actions.open

    fzf.setup({
      actions = {
        files = {
          true,
          ["ctrl-t"] = troubleFzf.actions.open_all,
          ["ctrl-q"] = troubleFzf.actions.open_selected,
        },
      },
    })

    -- lua require("trouble").next({ jump = true })

    vim.keymap.set("n", "[[", function()
      trouble.next({ jump = true })
    end, { desc = "Jump to next trouble entry" })
    vim.keymap.set("n", "]]", function()
      trouble.prev({ jump = true })
    end, { desc = "Jump to previous trouble entry" })
    -- vim.keymap.set("n", "gr", fzf.lsp_references, { desc = "Find references" })
    -- vim.keymap.set("n", ";f", fzf.files, { desc = "Find files" })
    -- vim.keymap.set("n", ";b", fzf.buffers, { desc = "Find buffers" })
    -- vim.keymap.set("n", ";,", fzf.resume, { desc = "Resume last window" })
    -- vim.keymap.set("n", ";w", fzf.grep_cword, { desc = "Find current word" })
    -- vim.keymap.set("n", ";k", fzf.keymaps, { desc = "Find keymaps" })
    -- vim.keymap.set("n", ";s", fzf.live_grep, { desc = "Find greping" })
  end,
}
