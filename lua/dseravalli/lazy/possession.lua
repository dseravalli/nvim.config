return {
  'jedrzejboczar/possession.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require("possession").setup({
      autosave = {
        current = true
      }
    })

    vim.keymap.set('n', '<leader>ps', "<CMD>PossessionSave<CR>", { desc = "[P]ossession [S]ave" })
    vim.keymap.set('n', '<leader>pc', "<CMD>PossessionSaveCwd<CR>", { desc = "[P]ossession Save [C]wd" })
    vim.keymap.set('n', '<leader>pd', "<CMD>PossessionDelete<CR>", { desc = "[P]ossession [D]elete" })
  end,
}
