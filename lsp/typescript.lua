---@type vim.lsp.Config
return {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "tsconfig.json", "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  },
}
