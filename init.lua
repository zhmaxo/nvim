vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- require('plugins/lazy_bootstrap') -- lua/plugins/lazy_bootstrap
require('config/lazy') -- lua/config/lazy

local util = require('core.util') -- lua/core/util

util.load('options')
util.load('keymaps')
util.load('autocmds')

-- old stuff
-- require('plugins/packer_install') -- lua/plugins/packer_install
