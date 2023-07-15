local function augroup(name)
  return vim.api.nvim_create_augroup('group_' .. name, { clear = true })
end

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  group = augroup('close_with_q'),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- disable swapfile for some filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = augroup('noswap'),
  pattern = {
    'oil',
  },
  callback = function(event)
    vim.cmd('set noswapfile')
  end,
})
