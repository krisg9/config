local present, metals = pcall(require, "metals")
local dap = require "dap"
require("core.utils").load_mappings "metals" -- mappings for metals
require("core.utils").load_mappings "lspconfig"

if not present then
  return
end

local metals_config = metals.bare_config()
metals_config.init_options.statusBarProvider = "on" -- reccomended

metals_config.settings = {
  showImplicitArguments = true,
  showInferredType = true,
  showImplicitConversionsAndClasses = true,
  enableSemanticHighlighting = false,
}

metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

metals_config.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true -- formatting
  client.server_capabilities.documentRangeFormattingProvider = true
  metals.setup_dap() -- dap setup
end

-- dap
dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runtType = "runOrTestFile",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runtType = "testTarget",
    },
  },
}

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

-- start eveerything up upon opening a file
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "sc" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
