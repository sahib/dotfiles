return {
	-- run tests from within neovim:
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-go"
    },
	config = function()
		require("neotest").setup({
		  adapters = {
			require("neotest-go")({}),
		  },
		})

		local opts = {noremap = true, silent = true}
		local api = require("neotest")
		local run_all_tests = function()
			api.run.run(vim.fn.expand("%"))
		end

		vim.keymap.set('n', 'gt', api.run.run, opts)
		vim.keymap.set('n', 'gT', run_all_tests, opts)
	end,
}
