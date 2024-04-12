local autocmd = vim.api.nvim_create_autocmd
require("dap-python").setup "/bin/python"

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
