local ui_group = vim.api.nvim_create_augroup("dseravalli.ui", { clear = true })
local lsp_group = vim.api.nvim_create_augroup("dseravalli.lsp", { clear = true })

-- 1) Native completion + format-on-save (buffer-local, duplicate-safe)
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

		-- If the server formats, set up format-on-save for this buffer (one per buffer)
		if client.supports_method and client:supports_method("textDocument/formatting") then
			-- prevent stacking if multiple clients attach / config reloads
			vim.api.nvim_clear_autocmds({ group = lsp_group, buffer = buf, event = "BufWritePre" })

			vim.api.nvim_create_autocmd("BufWritePre", {
				group = lsp_group,
				buffer = buf,
				desc = "LSP format on save",
				callback = function()
					vim.lsp.buf.format({ bufnr = buf, id = client.id, async = false, timeout_ms = 1000 })
				end,
			})
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

-- 3) Strip trailing whitespace only when no LSP formatter is active
vim.api.nvim_create_autocmd("BufWritePre", {
	group = ui_group,
	desc = "Strip trailing whitespace if no LSP formatting",
	callback = function(args)
		-- Skip for binary/readonly or some filetypes if desired
		if vim.bo[args.buf].modifiable == false or vim.bo[args.buf].buftype ~= "" then
			return
		end

		-- If any attached client supports formatting, let it handle whitespace
		for _, c in pairs(vim.lsp.get_active_clients({ bufnr = args.buf })) do
			if c.supports_method and c:supports_method("textDocument/formatting") then
				return
			end
		end

		-- Otherwise, trim trailing spaces
		vim.cmd([[%s/\s\+$//e]])
	end,
})
