local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "go",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
}

M.mason = {
  ensure_installed = {
    "autopep8",
    "lua-language-server",
    "chrome-debug-adapter",
    "css-lsp",
    "cssmodules-language-server",
    "debugpy",
    "delve",
    "deno",
    "flake8",
    "go-debug-adapter",
    "gofumpt",
    "gopls",
    "html-lsp",
    "isort",
    "jdtls",
    "jedi-language-server",
    "json-lsp",
    "latexindent",
    "lemminx",
    "ltex-ls",
    "prettier",
    "shellcheck",
    "shfmt",
    "sql-formatter",
    "sqlfluff",
    "sqlls",
    "stylua",
    "tailwindcss-language-server",
    "tectonic",
    "typescript-language-server",
    "vale",
    "xmlformatter",
    "yaml-language-server",
    "yamlfmt",
    "yamllint",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

--remove text suggestions
M.nvimcmp = {
  override_options = {
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "nvim_lua" },
      { name = "path" },
    },
  },
}

return M
