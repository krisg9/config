local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- scala
  b.formatting.scalafmt,

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css", "scss" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.formatting.autopep8,
  -- go
  b.formatting.gofumpt,
  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- latex
  b.formatting.latexindent,
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
