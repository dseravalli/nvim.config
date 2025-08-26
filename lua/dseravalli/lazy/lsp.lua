return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"nvim-lua/plenary.nvim",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"j-hui/fidget.nvim",
			"zbirenbaum/copilot-cmp",
		},

		config = function()
			-- Setup dependencies
			require("fidget").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"groovyls",
					"rust_analyzer",
					"gopls",
					"ts_ls",
					"solargraph",
					"prismals",
					"html",
					"bashls",
					"svelte",
					"jsonls",
					"pyright",
					"tailwindcss",
					"lua_ls",
					"ruff",
				},
			})

			-- Setup completion
			local cmp = require("cmp")
			local cmp_lsp = require("cmp_nvim_lsp")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-y>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<Tab>"] = nil,
					["<S-Tab>"] = nil,
				}),
				sources = {
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				},
			})

			-- LSP capabilities
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)

			-- On attach function
			local on_attach = function(_, bufnr)
				local nmap = function(keys, func, desc)
					if desc then
						desc = "LSP: " .. desc
					end
					vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
				end

				nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				nmap("<leader>vca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				nmap("<leader>wds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				nmap("K", vim.lsp.buf.hover, "Hover Documentation")
				nmap("<leader>k", vim.lsp.buf.signature_help, "Signature Documentation")

				nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			end

			-- Server configurations
			local lspconfig = require("lspconfig")

			-- Default setup for most servers
			local default_config = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			-- Simple servers that use default config
			local simple_servers = {
				"groovyls",
				"rust_analyzer",
				"gopls",
				"ts_ls",
				"solargraph",
				"prismals",
				"bashls",
				"svelte",
				"jsonls",
			}

			for _, server in ipairs(simple_servers) do
				lspconfig[server].setup(default_config)
			end

			-- Servers with custom configurations
			lspconfig.html.setup(vim.tbl_deep_extend("force", default_config, {
				filetypes = { "html", "twig", "hbs" },
			}))

			lspconfig.pyright.setup(vim.tbl_deep_extend("force", default_config, {
				settings = {
					pyright = {
						disableOrganizeImports = true,
						disableTaggedHints = true,
					},
					python = {
						pythonPath = vim.fn.exepath("python3"),
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							typeCheckingMode = "standard",
							diagnosticMode = "workspace",
							diagnosticSeverityOverrides = {
								reportUndefinedVariable = "none",
							},
						},
					},
				},
			}))

			lspconfig.tailwindcss.setup(vim.tbl_deep_extend("force", default_config, {
				filetypes = {
					"html",
					"css",
					"templ",
					"astro",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"svelte",
					"vue",
				},
				init_options = { userLanguages = { templ = "html" } },
			}))

			lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", default_config, {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim", "Snacks" },
						},
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			}))

			lspconfig.ruff.setup(vim.tbl_deep_extend("force", default_config, {
				init_options = { settings = { args = { "--select=E,F,B,Q,ARG" } } },
			}))

			-- Install formatters and linters via Mason
			vim.defer_fn(function()
				local mr = require("mason-registry")

				local ensure_installed_tools = {
					"shellcheck",
					"shfmt",
					"isort",
					"prettier",
					"stylua",
				}

				mr.refresh(function()
					for _, tool in ipairs(ensure_installed_tools) do
						local p = mr.get_package(tool)
						if not p:is_installed() then
							p:install()
						end
					end
				end)
			end, 100)

			-- Configure diagnostics
			vim.diagnostic.config({
				float = {
					source = true,
				},
			})

			-- Diagnostic keymaps
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, { desc = "Go to previous diagnostic message" })
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, { desc = "Go to next diagnostic message" })
		end,
	},
}
