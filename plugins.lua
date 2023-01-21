local M = {}

M["max397574/better-escape.nvim"] = {
  event = "InsertEnter",
  config = function()
    require("better_escape").setup()
  end,
}

M["tpope/vim-surround"] = {}

M["neovim/nvim-lspconfig"] = {
  config = function()
    local on_attach = require("plugins.configs.lspconfig").on_attach
    local capabilities = require("plugins.configs.lspconfig").capabilities

    local lspconfig = require "lspconfig"

    local servers = { "html", "cssls", "svelte", "tsserver", "emmet_ls", "gopls", "marksman", "rust_analyzer" }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end
  end,
}

M["jose-elias-alvarez/null-ls.nvim"] = {
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

      b.formatting.gofumpt,
      -- b.formatting.goimports_reviser,
      b.formatting.goimports,

      b.formatting.stylua,
      b.formatting.rustfmt.with {
        filetype = "rust",
      },
    }

    null_ls.setup {
      debug = true,
      sources = sources,
    }
  end,
}

M["folke/which-key.nvim"] = {
  disable = false,
}

M["ggandor/leap.nvim"] = {
  config = function()
    local leap = require "leap"
    leap.add_default_mappings()
  end,
}

M["nvim-treesitter/nvim-treesitter-context"] = {
  after = "nvim-treesitter",
}

M["nvim-treesitter/nvim-treesitter"] = {
  override_options = function()
    return {
      ensure_installed = "all",
    }
  end,
}

M["terrastruct/d2-vim"] = {}

M["mbbill/undotree"] = {}

M["ThePrimeagen/harpoon"] = {}

M["github/copilot.vim"] = {
  config = function()
    -- vim.api.nvim_set_keymap("i", "<C-o>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end,
}

return M
