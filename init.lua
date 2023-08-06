local vimrc_path = os.getenv("HOME") .. "/.vimrc"
local f = io.open(vimrc_path, "r")
if f ~= nil then
	vim.cmd("source " .. vimrc_path)
	print("found .vimrc")
else
	print("not found .vimrc")
end

-- require('plugins/lazy_bootstrap') -- lua/plugins/lazy_bootstrap
require("config/lazy") -- lua/config/lazy

local util = require("core.util") -- lua/core/util

util.load("options")
util.load("keymaps")
util.load("autocmds")

-- old stuff
-- require('plugins/packer_install') -- lua/plugins/packer_install
