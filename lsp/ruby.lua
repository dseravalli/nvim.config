---@type vim.lsp.Config
return {
	cmd = { "ruby-lsp" },
	root_markers = { "Gemfile", ".git" },
	filetypes = { "ruby" },
	init_options = {
		formatter = "standard",
		linters = { "standard" },
		addonSettings = {
			["Ruby LSP Rails"] = {
				enablePendingMigrationsPrompt = false,
			},
		},
	},
}
