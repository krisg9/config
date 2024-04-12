local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "biome" },
    javascriptreact = { "biome" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "biome" },
    jsonc = { "biome" },
    sh = { "shfmt" },
    go = { "gofumpt" },
    scala = { "scalafmt" },
  },
}

require("conform").setup(options)
