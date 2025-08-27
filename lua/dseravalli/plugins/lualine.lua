return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local function session_name()
			return require("possession.session").get_session_name() or ""
		end

		require("lualine").setup({
			icons_enabled = true,
			theme = "tokyonight",
			component_separators = "|",
			section_separators = "",
			sections = {
				lualine_a = { session_name },
			},
			extensions = { "trouble" },
		})
	end,
}
