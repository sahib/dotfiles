return {
    -- Use the debug-adapter-protocol to talk to a wide
    -- range of debuggers.
    {
         'mfussenegger/nvim-dap',
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
    },
}
