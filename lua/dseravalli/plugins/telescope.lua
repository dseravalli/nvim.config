return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	cmd = "Telescope",
	keys = {
		{ "<leader>?", "<cmd>Telescope oldfiles<cr>", desc = "[?] Find recently opened files", mode = "n" },
		{ "<leader><space>", "<cmd>Telescope buffers<cr>", desc = "[ ] Find existing buffers", mode = "n" },
		{
			"<leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(
					require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
				)
			end,
			desc = "[/] Fuzzily search in current buffer",
			mode = "n",
		},
		{ "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Search Git Files", mode = "n" },
		{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[S]earch [F]iles", mode = "n" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "[S]earch [H]elp", mode = "n" },
		{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "[S]earch current [W]ord", mode = "n" },
		{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "[S]earch by [G]rep", mode = "n" },
		{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "[S]earch [D]iagnostics", mode = "n" },
		{ "<leader>sr", "<cmd>Telescope resume<cr>", desc = "[S]earch [R]esume", mode = "n" },
		{
			"<leader>sp",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
			end,
			desc = "[P]roject [S]earch",
			mode = "n",
		},
		{ "<leader>ss", "<cmd>Telescope possession list<cr>", desc = "List sessions", mode = "n" },

		-- LSP related
		{
			"gd",
			function()
				require("telescope.builtin").lsp_definitions()
			end,
			desc = "[G]oto [D]efinition",
			mode = "n",
		},
		{
			"gr",
			function()
				require("telescope.builtin").lsp_references()
			end,
			desc = "[G]oto [R]eferences",
			mode = "n",
		},
		{
			"gI",
			function()
				require("telescope.builtin").lsp_implementations()
			end,
			desc = "[G]oto [I]mplementation",
			mode = "n",
		},
		{
			"<leader>D",
			function()
				require("telescope.builtin").lsp_type_definitions()
			end,
			desc = "Type [D]efinition",
			mode = "n",
		},
		{
			"<leader>wds",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "[D]ocument [S]ymbols",
			mode = "n",
		},
		{
			"<leader>ws",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols()
			end,
			desc = "[W]orkspace [S]ymbols",
			mode = "n",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jedrzejboczar/possession.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		require("telescope").setup({})
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "possession")
	end,
}
