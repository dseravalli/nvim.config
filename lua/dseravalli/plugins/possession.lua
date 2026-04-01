return {
  "jedrzejboczar/possession.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ps", "<CMD>PossessionSave<CR>", desc = "[P]ossession [S]ave" },
    { "<leader>pc", "<CMD>PossessionSaveCwd<CR>", desc = "[P]ossession Save [C]wd" },
    { "<leader>pd", "<CMD>PossessionDelete<CR>", desc = "[P]ossession [D]elete" },
  },
  opts = {
    autosave = {
      current = true,
      cwd = true,
    },
  },
}
