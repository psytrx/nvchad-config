-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "nord",
}

M.plugins = {
  user = {
    ["max397574/better-escape.nvim"] = {
      event = "InsertEnter",
      config = function()
        require("better_escape").setup()
      end,
    },

    ["tpope/vim-surround"] = {},

    ["neovim/nvim-lspconfig"] = {
      config = function()
        local lspconfig = require "lspconfig"

        local configs = require "plugins.configs.lspconfig"
        local on_attach = configs.on_attach
        local capabilities = configs.capabilities

        local servers = { "html", "cssls", "svelte", "tsserver", "emmet_ls", "gopls", "marksman" }

        for _, lsp in ipairs(servers) do
          lspconfig[lsp].setup {
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end
      end,
    },

    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
        local present, null_ls = pcall(require, "null-ls")
        if not present then
          return
        end

        local b = null_ls.builtins

        local sources = {
          -- webdev stuff
          b.formatting.prettier.with {
            extra_filetypes = { "svelte", "md", "json" },
          },

          b.formatting.gofmt,
          b.formatting.goimports,
        }

        null_ls.setup {
          debug = true,
          sources = sources,
        }
      end,
    },

    ["nvim-treesitter/nvim-treesitter-context"] = {
      after = "nvim-treesitter",
    }
  },

  override = {
    ["nvim-treesitter/nvim-treesitter"] = {
      ensure_installed = "all",
    },
  },
}

M.mappings = {}

return M
