return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python"
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          args = { "--verbose", "-rP" }
        })
      }
    })

    vim.keymap.set('n', '<leader>tc', function() require('neotest').run.run() end, { desc = 'Run Nearest Test' })
    vim.keymap.set('n', '<leader>tp', function() require('neotest').run.run_last() end, { desc = 'Run Prev Test' })
    vim.keymap.set('n', '<leader>tT', function() require('neotest').run.run(vim.uv.cwd()) end,
      { desc = 'Run All Test Files' })
    vim.keymap.set('n', '<leader>td', function() require('neotest').run.run({ strategy = "dap" }) end,
      { desc = 'Debug test' })
    vim.keymap.set('n', '<leader>to', function() require("neotest").output_panel.toggle() end,
      { desc = 'Open test output' })
    vim.keymap.set('n', '<leader>tO', function() require("neotest").output.open() end,
      { desc = 'Show single test output' })
    vim.keymap.set('n', '<leader>ts', function() require("neotest").summary.toggle() end, { desc = 'Show test summary' })
  end,
}
