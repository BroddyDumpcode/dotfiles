vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

  -- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

  -- optionally enable 24-bit colour
vim.opt.termguicolors = true

  -- empty setup using defaults
require("nvim-tree").setup()

  -- OR setup with a config

  ---@type nvim_tree.config
local config = {
  sort = {
    sorter = "case_sensitive",
    },
    view = {
    width = 30,
    },
    renderer = {
    group_empty = true,
    },
    filters = {
    dotfiles = true,
    },
  }
require("nvim-tree").setup(config)

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    local api = require("nvim-tree.api")


    if vim.fn.isdirectory(data.file) == 1 then
      vim.cmd.cd(data.file)
      api.tree.open()
    end
  end,
})
-- coc.nvim keymaps
vim.keymap.set("i", "<CR>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#confirm"]()
  else
    return "<CR>"
  end
end, { expr = true, noremap = true })

-- Tab untuk navigate autocomplete
vim.keymap.set("i", "<Tab>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#next"](1)
  else
    return "<Tab>"
  end
end, { expr = true, noremap = true })

vim.keymap.set("i", "<S-Tab>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#prev"](1)
  else
    return "<S-Tab>"
  end
end, { expr = true, noremap = true })
