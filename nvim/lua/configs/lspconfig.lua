require("nvchad.configs.lspconfig").defaults()
--[[
vim.lsp.config("pyright", {
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/pyright-langserver"), "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyrightconfig.json", "setup.py", ".git" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})
]]
local servers = { "html", "cssls", "pyright" }
vim.lsp.enable(servers)
