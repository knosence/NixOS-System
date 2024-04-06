return {
  "mfussenegger/nvim-dap",
  dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

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

    vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug: [T]oggle Breakpoint" })
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebug: [C]ontinue" })
    vim.keymap.set("n", "<leader>dr", dap.step_over, { desc = "[D]ebug: Step Ove[r]" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebug: Step [I]nto" })
    vim.keymap.set("n", "<leader>dt", dap.step_out, { desc = "[D]ebug: Step ou[t]" })
  end,
}
