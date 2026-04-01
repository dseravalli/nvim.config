return {
  "williamboman/mason.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("mason").setup()

    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
    vim.env.PATH = mason_bin .. ":" .. vim.env.PATH

    local ensure_installed = {
      -- LSP servers
      "basedpyright",
      "bash-language-server",
      "docker-language-server",
      "gopls",
      "html-lsp",
      "json-lsp",
      "lua-language-server",
      "ruby-lsp",
      "tailwindcss-language-server",
      "terraform-ls",
      "typescript-language-server",
      "yaml-language-server",
      -- Formatters
      "prettier",
      "rubocop",
      "ruff",
      "sqruff",
      "stylua",
      -- Linters
      "shellcheck",
      "shfmt",
      -- Debuggers
      "delve",
      "js-debug-adapter",
    }

    vim.defer_fn(function()
      local mr = require("mason-registry")
      mr.refresh(function()
        for _, tool in ipairs(ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end, 100)
  end,
}
