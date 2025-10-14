---@type vim.lsp.Config
return {
  cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
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
