local mason_ruby_lsp = vim.fn.stdpath("data") .. "/mason/bin/ruby-lsp"
local ruby_lsp = vim.fn.executable(mason_ruby_lsp) == 1 and mason_ruby_lsp or vim.fn.exepath("ruby-lsp")

---@type vim.lsp.Config
return {
  cmd = { ruby_lsp ~= "" and ruby_lsp or "ruby-lsp" },

  root_markers = { "Gemfile", ".git" },

  filetypes = { "ruby" },

  init_options = {
    linters = { "rubocop" },
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}
