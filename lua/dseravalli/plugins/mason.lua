return {
  "williamboman/mason.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("mason").setup()

    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
    vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
  end,
}
