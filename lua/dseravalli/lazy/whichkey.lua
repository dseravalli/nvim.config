return {
  'folke/which-key.nvim',
  opts = {},
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('which-key').add({
      { "<leader>s",  group = "[S]earch" },
      { "<leader>s_", hidden = true },
      { "<leader>w",  group = "[W]orkspace" },
      { "<leader>w_", hidden = true },
      { "<leader>r",  group = "[R]efactor & [R]ename" },
      { "<leader>r_", hidden = true },
      { "<leader>t",  group = "[T]est & [T]rouble" },
      { "<leader>t_", hidden = true },
      { "<leader>p",  group = "[P]ossession" },
      { "<leader>p_", hidden = true },
    })
  end
}
