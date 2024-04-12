local map = vim.keymap.set

-- Todo Comments
map("n", "<leader>tt", "<cmd>TodoTelescope<cr>", { desc = "Todo Telescope" })

-- General mappings
map("n", ";", ":", { desc = "enter command mode" })
map("n", "<leader>cl", "<cmd>lua vim.lsp.codelens.run()<cr>", { desc = "Codelens" })

-- Metals mappings
map("n", "<leader>lmc", "<cmd>lua require('telescope').extensions.metals.commands()<cr>")

-- Trouble mappings
map("n", "<leader>tr", "<cmd>TroubleToggle<cr>")

-- DAP mappings
map("n", "<F5>", "<cmd>lua require('dap').continue()<cr>", { desc = "Start Debugging" })
map("n", "<F10>", "<cmd>lua require('dap').step_over()<cr>", { desc = "Step Over" })
map("n", "<F11>", "<cmd>lua require('dap').step_into()<cr>", { desc = "Step Into" })
map("n", "<F12>", "<cmd>lua require('dap').step_out()<cr>", { desc = "Step Out" })
map("n", "<leader>br", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
map(
  "n",
  "<leader>BR",
  "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
  { desc = "Set Breakpoint Condition" }
)
map(
  "n",
  "<leader>lp",
  "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
  { desc = "Log point message" }
)
map("n", "<leader>repl", "<cmd>lua require('dap').repl.open()<cr>", { desc = "Open REPL" })
map("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", { desc = "Toggle DAP GUI" })
map("n", "<leader>vl", "<cmd>lua require('dapui').eval()<cr>", { desc = "Evaluate expression" })
