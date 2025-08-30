---@type vim.lsp.Config
return {
  cmd = { "ruby-lsp" },
  root_markers = { "Gemfile", ".git" },
  filetypes = { "ruby" },
  init_options = {
    enabledFeatures = {
      formatting = false,
    },
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
}
