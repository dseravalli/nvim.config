return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
      'mxsdev/nvim-dap-vscode-js',
      'mfussenegger/nvim-dap-python',
      'nvim-neotest/nvim-nio'
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

      require('mason-nvim-dap').setup {
        automatic_setup = true,

        handlers = {},

        ensure_installed = {
          'python',
          'delve',
        },
      }

      vim.keymap.set('n', '<leader>ds', dap.continue, { desc = 'Debug: Start/Continue' })
      vim.keymap.set('n', '<leader>dl', dap.step_into, { desc = 'Debug: Step Into' })
      vim.keymap.set('n', '<leader>dj', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<leader>dh', dap.step_out, { desc = 'Debug: Step Out' })
      vim.keymap.set('n', '<leader>dq', function()
        dap.disconnect({ terminateDebuggee = true })
      end, { desc = 'Debug: Quit' })
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dB', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Debug: Set Breakpoint' })

      -- Dap UI setup
      dapui.setup()

      -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
      vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close

      -- Install golang specific config
      require('dap-go').setup()

      -- Install python specific config
      --
      require('dap').configurations['python'] = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch file (console = integratedTerminal, justMyCode = false)',
          program = '${file}',
          console = 'integratedTerminal',
          justMyCode = false,
        },
      }

      require('dap-python').setup('/Users/dseravalli/.pyenv/shims/python3', {
        include_configs = false,
        console = 'integratedTerminal',
        pythonPath = nil,
      })

      -- Install JS specific config
      require('dap-vscode-js').setup({
        debugger_path = '/Users/dseravalli/Developer/build/vscode-js-debug',
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
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
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },
        },
      }
    end,
  }
}
