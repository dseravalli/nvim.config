return {
	"williamboman/mason.nvim",
  lazy = false,
  priority = 1000,
	config = function()
		require("mason").setup()
	end,
}
