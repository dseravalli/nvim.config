return {
	-- tokyonight
	-- variations are tokyonight-night, tokyonight-day, tokyonight-storm, tokynight-moon
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-moon")
		end,
	},

	-- rosepine
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
	},
}
