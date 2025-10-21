return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    vim.defer_fn(function()
      local mr = require("mason-registry")

      local ensure_installed_tools = {
        "shellcheck",
        "shfmt",
        "isort",
        "prettier",
        "stylua",
        "ruff",
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

    conform.setup({
      formatters_by_ft = {
        python = { "isort", "ruff_format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        ruby = { "rubocop" },
        sql = { "sqruff" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      },
    })
  end,
}
