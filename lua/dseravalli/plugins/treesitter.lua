return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "joerdav/templ.vim",
    "vrischmann/tree-sitter-templ",
  },
  config = function()
    require("nvim-treesitter").setup({})
    require("nvim-treesitter").install({
      "c",
      "cpp",
      "go",
      "lua",
      "python",
      "rust",
      "ruby",
      "tsx",
      "javascript",
      "typescript",
      "vimdoc",
      "vim",
      "bash",
      "terraform",
    })
  end,
}
