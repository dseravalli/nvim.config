---@type vim.lsp.Config
return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { ".git" },
  init_options = {
    provideFormatter = false,
  },
  on_init = function(client)
    client.settings = vim.tbl_deep_extend("force", client.settings or {}, {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    })
    client:notify("workspace/didChangeConfiguration", { settings = client.settings })
  end,
}
