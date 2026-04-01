return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup({})

    vim.keymap.set("x", "<leader>re", ":Refactor extract ", { desc = "Extract" })
    vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Extract to file" })
    vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "Extract variable" })
    vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "Inline variable" })
    vim.keymap.set("n", "<leader>rI", ":Refactor inline_func", { desc = "Inline function" })
    vim.keymap.set("n", "<leader>rb", ":Refactor extract_block", { desc = "Extract block" })
    vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file", { desc = "Extract block to file" })
  end,
}
