return {
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false,
    config = function()
      vim.g.coc_global_extensions = {
        "coc-pyright",
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp-signature-help",
  },
  {
    "rafamadriz/friendly-snippets",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "python", "html", "css"
      },
    },
  },
}
