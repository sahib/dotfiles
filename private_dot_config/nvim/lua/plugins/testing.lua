return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-go",
      "nvim-neotest/nvim-nio",
    },
    opts = {
      adapters = {
        "neotest-plenary",
        "neotest-go",
      },
    },
  },
}
