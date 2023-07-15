-- vim.wo.number = true
vim.o.linebreak = true
vim.opt.expandtab=true

vim.o.ignorecase = true
vim.o.smartcase = true
-- set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
--[[
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2

local options = {
	relativenumber = true,
	termguicolors = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
]]--
-- vim.opt.autoindent=true
-- vim.opt.smartindent=true
