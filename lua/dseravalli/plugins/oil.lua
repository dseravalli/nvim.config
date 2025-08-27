return {
	"stevearc/oil.nvim",
	cmd = "Oil",
	lazy = false,
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			columns = { "icon" },
			keymaps = {
				["<C-h>"] = false,
				["<C-p>"] = false,
			},
			view_options = {
				show_hidden = true,
			},
		})
	end,
}
