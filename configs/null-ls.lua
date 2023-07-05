local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
  -- scala
  -- b.formatting.scalafmt,
  -- webdev stuff
  b.formatting.deno_fmt, -- choose deno for ts/js files cuz its very fast!
  -- so prettier works only on these filetypes
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "scss" } },
  b.diagnostics.eslint,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.black,
  b.diagnostics.mypy,
  b.diagnostics.ruff,
  b.diagnostics.pylint,

  -- go
  b.formatting.gofumpt,
  b.diagnostics.golangci_lint,
  b.formatting.golines,

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
