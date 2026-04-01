return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  keys = {
    {
      "<leader>tc",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Nearest Test",
    },
    {
      "<leader>tp",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Prev Test",
    },
    {
      "<leader>tT",
      function()
        require("neotest").run.run(vim.uv.cwd())
      end,
      desc = "Run All Test Files",
    },
    {
      "<leader>td",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug test",
    },
    {
      "<leader>to",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Open test output",
    },
    {
      "<leader>tO",
      function()
        require("neotest").output.open()
      end,
      desc = "Show single test output",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Show test summary",
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          args = { "--verbose", "-rP" },
        }),
      },
    })
  end,
}
