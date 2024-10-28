return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      'nvimtools/none-ls.nvim',
      "nvim-lua/plenary.nvim",
      "folke/lazydev.nvim",
      "hrsh7th/nvim-cmp",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "j-hui/fidget.nvim",
    },

    config = function()
      local cmp = require("cmp")
      local cmp_lsp = require("cmp_nvim_lsp")
      local mason_lspconfig = require 'mason-lspconfig'
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities()
      )

      local servers = {
        groovyls = {},
        rust_analyzer = {},
        gopls = {},
        pyright = {
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
            }
          }
        },
        ts_ls = {},
        solargraph = {},
        prismals = {},
        html = { filetypes = { 'html', 'twig', 'hbs' } },
        tailwindcss = {
          filetypes = { 'html', 'css', 'templ', 'astro', 'javascript', 'typescript', 'react', 'svelte', 'vue' },
          init_options = { userLanguages = { templ = 'html' } },
        },
        lua_ls = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" }
            },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),

            },
            telemetry = {
              enable = false
            },
          },
        },
        ruff = {
          init_options = {
            settings = {
              lint = {
                select = { 'E', 'F', 'B', 'Q', 'ARG' },
              },
            },
          },
        },
        bashls = {},
        svelte = {},
        jsonls = {},
      }

      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>vca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        nmap('<leader>wds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- See `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')

        -- Lesser used LSP functionality
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        nmap('<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, '[W]orkspace [L]ist Folders')
      end

      require("fidget").setup({})
      require('mason').setup()

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
            init_options = (servers[server_name] or {}).init_options,
          }
        end,
      }

      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-y>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ["<Tab>"] = nil,
          ["<S-Tab>"] = nil,
        },
        sources = {
          { name = "nvim_lsp", group_index = 2 },
          { name = "luasnip",  group_index = 2 },
        }
      }

      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.isort,
        },
      })

      vim.defer_fn(function()
        local mr = require("mason-registry")

        -- List of formatters and linters to install --
        local ensure_installed_tools = {
          "shellcheck",
          "shfmt",
          "isort",
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


      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
      vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
      vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format buffer' })
    end,
  },
}
