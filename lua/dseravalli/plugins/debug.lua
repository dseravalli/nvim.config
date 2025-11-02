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
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      require("dap-python").setup("uv")

      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close

      local js_debugger_path = vim.fn.stdpath("data")
        .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"

      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = { js_debugger_path, "${port}" },
        },
      }

      dap.configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Current JS file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }

      dap.configurations.typescript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Current JS file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "tsx",
          sourceMaps = true,
          smartStep = true,
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
          skipFiles = { "<node_internals>/**", "${workspaceFolder}/node_modules/**" },
        },
      }
    end,
  },
}
