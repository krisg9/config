local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local custom_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  if client.server_capabilities.inlayHintProvider then
    -- vim.lsp.inlay_hint.enable(true)
  end
end

-- if you just want default config for the servers then put them in a table
local servers = {
  "docker_compose_language_service",
  "dockerls",
  "tailwindcss",
  "html",
  "cssls",
  "clangd",
  "gopls",
  "lua_ls",
  "jdtls",
  "pyright",
  "sqlls",
  "lua_ls",
  "dotls",
}

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
  }
end

-- sql
lspconfig.sqlls.setup {
  on_attach = function(client, bufnr)
    require("sqls").on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
-- latex
lspconfig.texlab.setup {}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
