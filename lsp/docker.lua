---@type vim.lsp.Config
return {
  cmd = { "docker-language-server", "start", "--stdio" },
  filetypes = { "dockerfile" },
  root_markers = {
    "Dockerfile",
    "docker-compose.yaml",
    "docker-compose.yml",
    "compose.yaml",
    "compose.yml",
    "docker-bake.json",
    "docker-bake.hcl",
    "docker-bake.override.json",
    "docker-bake.override.hcl",
  },
}
