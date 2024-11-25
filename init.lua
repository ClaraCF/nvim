-- Disable netrw --
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Speed up the loading process --
vim.loader.enable()

vim.g.mapleader = "<Space>"
vim.g.maplocalleader = "\\"

-- Tab indentation settings --
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.copyindent = true

-- Other editor configs --
vim.opt.number = true
vim.opt.relativenumber = true

-- Load Plugin Manager --
local plugins = require('plugins')
local lazy_config = require('lazy_config')
require('lazy').setup(plugins, lazy_config)

require('theme')
require('opts')
require('keys')
