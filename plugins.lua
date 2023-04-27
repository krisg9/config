local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- scala
  {
    "scalameta/nvim-metals",
    requires = "nvim-lua/plenary",
    lazy = false,
    config = function()
      require "custom.configs.metals"
    end,
  },
  -- git
  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "ray-x/web-tools.nvim",
    lazy = false,
    config = function()
      require("web-tools").setup {
        keymaps = {
          rename = nil, -- by default use same setup of lspconfig
          repeat_rename = ".", -- . to repeat
        },
        hurl = { -- hurl default
          show_headers = false, -- do not show http headers
          floating = false, -- use floating windows (need guihua.lua)
          formatters = { -- format the result by filetype
            json = { "jq" },
            html = { "prettier", "--parser", "html" },
          },
        },
      }
    end,
  },

  { "nanotee/sqls.nvim" },

  -- LaTex support
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.cmd [[
        let g:vimtex_view_method = 'zathura'
        let g:vimtex_view_general_viewer = 'zathura'
        let g:vimtex_view_enabled=1
      ]]
    end,
  },

  -- dap and dap-ui\
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
      require("dap-python").setup("python", {})
      require("dap-go").setup()
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end,
  },

  -- go dap
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  },

  -- dap python
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      { "rcarriga/nvim-dap-ui" },
    },
    config = function()
      require("dap-python").setup "/bin/python"
    end,
  },

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  { "goolord/alpha-nvim", disable = false }, -- enables dashboard

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  -- {
  --   "max397574/better-escape.nvim",
  --   event = "InsertEnter",
  --   config = function()
  --     require("better_escape").setup()
  --   end,
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  {
    "folke/which-key.nvim",
    enabled = true,
  },
}

return plugins
