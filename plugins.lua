local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false,
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    cmd = { "TodoTrouble", "TodoTelescope" },
    config = function()
      require("todo-comments").setup()
    end,
  },

  -- catppuccin theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  -- smooth scroll
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },

  -- markdown preview
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    ft = { "markdown", "vimwiki" },
    config = function()
      require("peek").setup {
        app = "browser",
        filetype = { "markdown", "vimwiki" },
      }
    end,
    init = function()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
  },

  -- telescope ui-select menu
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },

  -- scala
  {
    "scalameta/nvim-metals",
    requires = "nvim-lua/plenary",
    -- lazy = false,
    ft = { "scala", "sbt", "sc" },
    config = function()
      require "custom.configs.metals"
    end,
  },
  --
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
        hurl = {
          -- hurl default
          show_headers = false, -- do not show http headers
          floating = false, -- use floating windows (need guihua.lua)
          formatters = {
            -- format the result by filetype
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
    ft = "tex",
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
    config = function()
      require("dap-python").setup("python", {})
      require("dap-go").setup()
      require "custom.configs.dap"
      require("core.utils").load_mappings "dap"
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- go dap
  {
    "leoluz/nvim-dap-go",
    ft = "go",
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

  {
    "williamboman/mason.nvim",
    opts = {
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
        "pyright",
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
        "js-debug-adapter",
      },
    },
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
