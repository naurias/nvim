return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup()

    -- CodeLLDB adapter configuration
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        -- Command to run the `codelldb` executable. Adjust the path if needed.
        command = "/usr/bin/codelldb",
        args = { "--port", "${port}" },

        -- On windows you may have to uncomment this:
        -- detached = false,
      },
    }

    -- Define the configuration for debugging Rust
    dap.configurations.rust = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
          -- This function is called to get the debug target program
          -- You can change it to a fixed path to the compiled binary if you prefer
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        -- If you want to use a specific lldb terminal, you can specify it here:
        -- terminal = 'integrated'
      },
    }
    -- setting up events

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
  end,
}
