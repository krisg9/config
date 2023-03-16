---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.dap = {
  n = {
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "Start Debbuging",
    },
    ["<F10>"] = {
      function()
        require("dap").step_over()
      end,
      "Step Over",
    },
    ["<F11>"] = {
      function()
        require("dap").step_into()
      end,
      "Step Into",
    },
    ["<F12>"] = {
      function()
        require("dap").step_out()
      end,
      "Step Out",
    },
    ["<leader>br"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle Breakpoint",
    },
    ["<leader>BR"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      "Set Breakpoint Condition",
    },
    ["<leader>lp"] = {
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
      end,
      "Log point message",
    },
    ["<leader>repl"] = {
      function()
        require("dap").repl.open()
      end,
      "Open REPL",
    },
    ["<leader>du"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle DAP GUI",
    },
    ["<leader>vl"] = {
      function()
        require("dapui").eval()
      end,
      "Evaluate expression",
    },
  },
}

-- more keybinds!

return M
