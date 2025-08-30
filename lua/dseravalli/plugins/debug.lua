return {
  {
    "mfussenegger/nvim-dap",
    cmd = { "DapContinue", "DapToggleBreakpoint", "DapTerminate", "DapStepOver", "DapStepInto", "DapStepOut" },
    keys = {
      { "<leader>ds", "<cmd>DapContinue<cr>", desc = "Debug: Start/Continue" },
      { "<leader>dl", "<cmd>DapStepInto<cr>", desc = "Debug: Step Into" },
      { "<leader>dj", "<cmd>DapStepOver<cr>", desc = "Debug: Step Over" },
      { "<leader>dh", "<cmd>DapStepOut<cr>", desc = "Debug: Step Out" },
      {
        "<leader>dq",
        function()
          require("dap").disconnect({ terminateDebuggee = true })
        end,
        desc = "Debug: Quit",
      },
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Debug: Toggle Breakpoint" },
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Debug: Set Breakpoint",
      },
      {
        "<F7>",
        function()
          require("dapui").toggle()
        end,
        desc = "Debug: See last session result.",
      },
    },
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "leoluz/nvim-dap-go",
      "mxsdev/nvim-dap-vscode-js",
      "mfussenegger/nvim-dap-python",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

      require("mason-nvim-dap").setup({
        automatic_setup = true,

        handlers = {},

        ensure_installed = {
          "python",
          "delve",
          "js-debug-adapter",
        },
      })

      -- Dap UI setup
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close

      -- Install golang specific config
      require("dap-go").setup()

      -- Install python specific config
      --
      require("dap").configurations["python"] = {
        {
          type = "python",
          request = "launch",
          name = "Launch file (console = integratedTerminal, justMyCode = false)",
          program = "${file}",
          console = "integratedTerminal",
          justMyCode = false,
        },
      }

      -- Let dap-python auto-detect the Python interpreter
      require("dap-python").setup(nil)

      -- Install JS specific config
      require("dap-vscode-js").setup({
        -- Use Mason's installation path for js-debug-adapter
        debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
      })

      require("dap").configurations["javascript"] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch current file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
      require("dap").configurations["typescript"] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch current file (Typescript)",
          program = "${file}",
          cwd = "${workspaceFolder}",
          -- runtimeArgs = { '--loader=ts-node/esm' },
          runtimeExecutable = "ts-node",
          sourceMaps = true,
          protocol = "inspector",
          outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
          skipFiles = { "<node_internals>/**", "node_modules/**" },
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },
        },
      }
    end,
  },
}
