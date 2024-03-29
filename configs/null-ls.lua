local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  -- webdev stuff
  -- b.formatting.deno_fmt, -- choose deno for ts/js files cuz its very fast!

  -- so prettier works only on these filetypes
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "scss" } },
  -- b.diagnostics.eslint,
  b.formatting.biome,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck,

  -- YAML
  b.formatting.yamlfmt,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.ruff,
  b.diagnostics.ruff,

  -- go
  b.formatting.gofumpt,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- latex
  b.formatting.latexindent,

  b.diagnostics.jsonlint,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function()
    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
}
