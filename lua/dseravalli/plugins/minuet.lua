return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        blink = { enable_auto_complete = true },
        lsp = { completion = { enable = false } },
        provider = "gemini",
        provider_options = {
          gemini = {
            model = "gemini-3.1-flash-lite-preview",
            optional = {
              generationConfig = {
                maxOutputTokens = 256,
                thinkingConfig = {
                  -- disable for 2.x models
                  -- thinkingBudget = 0,
                  -- disable for 3.x models
                  thinkingLevel = "minimal",
                },
              },
            },
          },
        },
      })
    end,
  },
}
