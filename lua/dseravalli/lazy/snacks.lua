return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys", gap = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 2 } },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
        { section = "startup" },
      },
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<leader>c",  function() Snacks.bufdelete() end,               desc = "Close buffer" },
    { "<leader>h",  function() Snacks.notifier.hide() end,           desc = "Dismiss All Notifications" },
    { "<leader>gg", function() Snacks.lazygit() end,                 desc = "Lazygit" },
    { "<leader>gb", function() Snacks.git.blame_line() end,          desc = "GitBlame Line" },
    { "<leader>gB", function() Snacks.gitbrowse() end,               desc = "Git Browse" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end,        desc = "Lazygit Current File History" },
    { "<leader>gl", function() Snacks.lazygit.log() end,             desc = "Lazygit Log (cwd)" },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",              mode = { "n", "t" } },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",              mode = { "n", "t" } },
  }
}
