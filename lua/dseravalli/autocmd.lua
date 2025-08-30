local ui_group = vim.api.nvim_create_augroup("dseravalli.ui", { clear = true })
local lsp_group = vim.api.nvim_create_augroup("dseravalli.lsp", { clear = true })

-- 1) Native completion, disable LSP formatters
vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local buf = args.buf

    -- Enable native completion if available
    if
      client.supports_method
      and client:supports_method("textDocument/completion")
      and vim.lsp.completion
      and vim.lsp.completion.enable
    then
      vim.lsp.completion.enable(true, client.id, buf, { autotrigger = false })
    end

    -- Disable all LSP formatters to not step on conform
    if client.supports_method and client:supports_method("textDocument/formatting") then
      client.server_capabilities.documentFormattingProvider = false
    end
  end,
})

-- 2) Yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  group = ui_group,
  desc = "Briefly highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
  end,
})
