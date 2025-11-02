---@type vim.lsp.Config
return {
  cmd = { "terraform-ls", "serve" },
  root_markers = { ".terraform", ".terraform.lock.hcl", ".git" },
  filetypes = { "terraform" },
}
