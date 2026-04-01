require("dseravalli.set")
require("dseravalli.remap")
require("dseravalli.lazy_init")
require("dseravalli.autocmd")

-- Enable all LSP configs found in the lsp/ directory
local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
local lsp_configs = {}
for name, type in vim.fs.dir(lsp_dir) do
  if type == "file" and name:match("%.lua$") then
    table.insert(lsp_configs, (name:gsub("%.lua$", "")))
  end
end
vim.lsp.enable(lsp_configs)
