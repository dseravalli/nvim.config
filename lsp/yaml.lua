---@type vim.lsp.Config
return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml" },
  on_init = function(client)
    client.settings = vim.tbl_deep_extend("force", client.settings or {}, {
      yaml = {
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = require("schemastore").yaml.schemas(),
        validate = true,
      },
    })
    client:notify("workspace/didChangeConfiguration", { settings = client.settings })
  end,
}
