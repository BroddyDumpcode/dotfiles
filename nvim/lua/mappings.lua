require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

    -- default mappings
  api.map.on_attach.default(bufnr)

    -- custom mappings
  vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent,        opts("Up"))
  vim.keymap.set("n", "?",     api.tree.toggle_help,                  opts("Help"))
end

  -- pass to setup along with your other config
require("nvim-tree").setup({
    ---
  on_attach = my_on_attach,
    ---
})
