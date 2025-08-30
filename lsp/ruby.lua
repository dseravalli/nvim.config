---@type vim.lsp.Config
return {
  cmd = { "ruby-lsp" },
  root_markers = { "Gemfile", ".git" },
  filetypes = { "ruby" },
  init_options = {
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}
