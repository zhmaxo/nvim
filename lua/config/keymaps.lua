-- RUSSIAN KEYMAP --
vim.cmd [[set keymap=russian-jcukenwin]]
vim.o.iminsert = 0
vim.o.imsearch = 0
-- highlight lCursor guifg=NONE guibg=Cyan

-- REMAPS --
local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- map('n', '<leader>y', '"+y')
-- map('n', '<leader>p', '"+p')

-- map('n', '<leader>p', '', { name = 'path' })
map('n', '<leader>pf', vim.cmd[[cd %:p:h]], { desc = 'set current file' })
map('n', '<leader>uh', vim.cmd.checkhealth, { desc = 'checkhealth' })

map('n', '<leader>qb', vim.cmd.bd, { desc = 'close buffer' })
map('n', ']b', '<cmd>bn<cr>', { desc = 'buffer next' })
map('n', '[b', vim.cmd.bp, { desc = 'buffer prev' })

-- map('n', '<leader>qp', vim.cmd[[cd %:p:h]])

--[=[
-- stylua: ignore start

-- Create global tables with information about leader mappings in certain modes
-- Structure of tables is taken to be compatible with 'folke/which-key.nvim'.
leader_nmap = {}
leader_xmap = {}

-- b is for 'buffer'
leader_nmap.b = {
  ['name'] = '+buffer',
  --['a'] = { [[<Cmd>b#<CR>]],                                 'alternate' },
  --['d'] = { [[<Cmd>lua MiniBufremove.delete()<CR>]],         'delete' },
  --['D'] = { [[<Cmd>lua MiniBufremove.delete(0, true)<CR>]],  'delete!' },
  ['s'] = { [[<Cmd>lua new_scratch_buffer()<CR>]],        'scratch' },
  ['w'] = { [[<Cmd>lua MiniBufremove.wipeout()<CR>]],        'wipeout' },
  ['W'] = { [[<Cmd>lua MiniBufremove.wipeout(0, true)<CR>]], 'wipeout!' },
}

-- e is for 'explore'
leader_nmap.e = {
  ['name'] = '+explore',
  ['t'] = { [[<Cmd>NvimTreeToggle<CR>]],       'tree' },
  ['u'] = { [[<Cmd>UndotreeToggle<CR>]],       'undo-tree' },
  ['q'] = { [[<Cmd>lua toggle_quickfix()<CR>]], 'quickfix' },
}

-- f is for 'fuzzy find'
leader_nmap.f = {
  ['name'] = '+find',
  ['/'] = { [[<Cmd>Telescope search_history<CR>]],            '"/" history' },
  [':'] = { [[<Cmd>Telescope command_history<CR>]],           'commands' },
  ['b'] = { [[<Cmd>Telescope buffers<CR>]],                   'open buffers' },
  ['B'] = { [[<Cmd>Telescope current_buffer_fuzzy_find<CR>]], 'open buffers' },
  ['c'] = { [[<Cmd>Telescope git_commits<CR>]],               'commits' },
  ['C'] = { [[<Cmd>Telescope git_bcommits<CR>]],              'buffer commits' },
  ['d'] = { [[<Cmd>Telescope diagnostics<CR>]],               'diagnostic workspace' },
  ['D'] = { [[<Cmd>Telescope diagnostics bufnr=0<CR>]],       'diagnostic buffer' },
  -- Custom function defined in 'nvim-telescope' config
  ['f'] = { [[<Cmd>lua telescope_project_files()<cr>]],    'files' },
  ['g'] = { [[<Cmd>Telescope live_grep<CR>]],                 'grep search' },
  ['h'] = { [[<Cmd>Telescope help_tags<CR>]],                 'help tags' },
  ['H'] = { [[<Cmd>Telescope highlights<CR>]],                'highlight groups' },
  ['j'] = { [[<Cmd>Telescope jumplist<CR>]],                  'jumplist' },
  ['n'] = { [[<Cmd>TodoTelescope<CR>]],                       'notes' },
  ['o'] = { [[<Cmd>Telescope oldfiles<CR>]],                  'old files' },
  ['O'] = { [[<Cmd>Telescope vim_options<CR>]],               'options' },
  ['r'] = { [[<Cmd>Telescope resume<CR>]],                    'resume' },
  ['R'] = { [[<Cmd>Telescope lsp_references<CR>]],            'references (LSP)' },
  ['s'] = { [[<Cmd>Telescope spell_suggest<CR>]],             'spell suggestions' },
  ['S'] = { [[<Cmd>Telescope treesitter<CR>]],                'symbols (treesitter)' },
  ['t'] = { [[<Cmd>Telescope file_browser<CR>]],              'file browser' },
}

-- g is for git
leader_nmap.g = {
  ['name'] = '+git',
  ['A'] = { [[<Cmd>lua require("gitsigns").stage_buffer()<CR>]],        'add buffer' },
  ['a'] = { [[<Cmd>lua require("gitsigns").stage_hunk()<CR>]],          'add (stage) hunk' },
  ['b'] = { [[<Cmd>lua require("gitsigns").blame_line()<CR>]],          'blame line' },
  ['g'] = { [[<Cmd>lua open_lazygit()<CR>]],                         'git tab' },
  ['p'] = { [[<Cmd>lua require("gitsigns").preview_hunk()<CR>]],        'preview hunk' },
  ['q'] = { [[<Cmd>lua require("gitsigns").setqflist()<CR>:copen<CR>]], 'quickfix hunks' },
  ['u'] = { [[<Cmd>lua require("gitsigns").undo_stage_hunk()<CR>]],     'undo stage hunk' },
  ['x'] = { [[<Cmd>lua require("gitsigns").reset_hunk()<CR>]],          'discard (reset) hunk' },
  ['X'] = { [[<Cmd>lua require("gitsigns").reset_buffer()<CR>]],        'discard (reset) buffer' },
}

-- l is for 'LSP' (Language Server Protocol)
local formatting_command = [[<Cmd>lua vim.lsp.buf.formatting()<CR>]]
if vim.fn.has('nvim-0.8') == 1 then
  formatting_command = [[<Cmd>lua vim.lsp.buf.format({ async = true })<CR>]]
end
leader_nmap.l = {
  ['name'] = '+LSP',
  ['f'] = { formatting_command,                            'format' },
  ['R'] = { [[<Cmd>lua vim.lsp.buf.references()<CR>]],     'references' },
  ['a'] = { [[<Cmd>lua vim.lsp.buf.signature_help()<CR>]], 'arguments popup' },
  ['d'] = { [[<Cmd>lua vim.diagnostic.open_float()<CR>]],  'diagnostics popup' },
  ['i'] = { [[<Cmd>lua vim.lsp.buf.hover()<CR>]],          'information' },
  ['j'] = { [[<Cmd>lua vim.diagnostic.goto_next()<CR>]],   'next diagnostic' },
  ['k'] = { [[<Cmd>lua vim.diagnostic.goto_prev()<CR>]],   'prev diagnostic' },
  ['r'] = { [[<Cmd>lua vim.lsp.buf.rename()<CR>]],         'rename' },
  ['s'] = { [[<Cmd>lua vim.lsp.buf.definition()<CR>]],     'source definition' },
}

leader_xmap.l = {
  -- Using `:` instead of `<Cmd>` to go back to Normal mode after `<CR>`
  f = { [[:lua vim.lsp.buf.range_formatting()<CR>]], 'format selection' },
}

-- L is for 'Lua'
leader_nmap.L = {
  ['name'] = '+Lua',
  ['f'] = { '<Cmd>luafile %<CR>',                   '`luafile` buffer' },
  ['x'] = { [[<Cmd>lua execute_lua_line()<CR>]], 'execute `lua` line' },
}

-- m is for 'map'
leader_nmap.m = {
  ['name'] = '+Make',
  ['c'] = { [[<Cmd>lua MiniMap.close()<CR>]], 'close' },
  ['f'] = { [[<Cmd>lua MiniMap.toggle_focus()<CR>]], 'focus (toggle)' },
  ['o'] = { [[<Cmd>lua MiniMap.open()<CR>]], 'open' },
  ['r'] = { [[<Cmd>lua MiniMap.refresh()<CR>]], 'refresh' },
  ['s'] = { [[<Cmd>lua MiniMap.toggle_side()<CR>]], 'side (toggle)' },
  ['t'] = { [[<Cmd>lua MiniMap.toggle()<CR>]], 'toggle' },
}

-- o is for 'other'
local trailspace_toggle_command = [[<Cmd>lua vim.b.minitrailspace_disable = not vim.b.minitrailspace_disable<CR>]]
leader_nmap.o = {
  ['name'] = '+other',
  ['C'] = { [[<Cmd>lua MiniCursorword.toggle()<CR>]],  'cursor word hl toggle' },
  ['d'] = { [[<Cmd>Neogen<CR>]],                       'document' },
  ['h'] = { [[<Cmd>normal cxiacxila<CR>]],             'move arg left' },
  ['H'] = { [[<Cmd>TSBufToggle highlight<CR>]],        'highlight toggle' },
  ['g'] = { [[<Cmd>lua MiniDoc.generate()<CR>]],       'generate plugin doc' },
  ['l'] = { [[<Cmd>normal cxiacxina<CR>]],             'move arg right' },
  ['r'] = { [[<Cmd>lua MiniMisc.resize_window()<CR>]], 'resize to default width' },
  ['S'] = { [[<Cmd>lua insert_section()<CR>]],      'section insert' },
  ['t'] = { [[<Cmd>lua MiniTrailspace.trim()<CR>]],    'trim trailspace' },
  ['T'] = { trailspace_toggle_command,                 'trailspace hl toggle' },
  ['z'] = { [[<Cmd>lua MiniMisc.zoom()<CR>]],          'zoom toggle' },
}

-- r is for 'R'
leader_nmap.r = {
  ['name'] = '+R',
  -- Mappings starting with `T` send commands to current neoterm buffer, so
  -- some sort of R interpreter should already run there
  ['c'] = { [[<Cmd>T devtools::check()<CR>]],                   'check' },
  ['C'] = { [[<Cmd>T devtools::test_coverage()<CR>]],           'coverage' },
  ['d'] = { [[<Cmd>T devtools::document()<CR>]],                'document' },
  ['i'] = { [[<Cmd>T devtools::install(keep_source=TRUE)<CR>]], 'install' },
  ['k'] = { [[<Cmd>T rmarkdown::render("%")<CR>]],              'knit file' },
  ['l'] = { [[<Cmd>T devtools::load_all()<CR>]],                'load all' },
  ['T'] = { [[<Cmd>T testthat::test_file("%")<CR>]],            'test file' },
  ['t'] = { [[<Cmd>T devtools::test()<CR>]],                    'test' },
}

leader_xmap.r = {
  ['name'] = '+R',
  -- Copy to clipboard and make reprex (which itself is loaded to clipboard)
  ['x'] = { [["+y :T reprex::reprex()<CR>]],                    'reprex selection' },
}

-- s is for 'send' (Send text to neoterm buffer)
leader_nmap.s = { [[<Cmd>TREPLSendLine<CR>j]], 'send to terminal' }
-- In simple visual mode send text and move to the last character in
-- selection and move to the right. Otherwise (like in line or block visual
-- mode) send text and move one line down from bottom of selection.
leader_xmap.s = {
  [[mode() ==# "v" ? ":TREPLSendSelection<CR>`>l" : ":TREPLSendSelection<CR>'>j"]],
  'send to terminal',
  expr = true,
}

-- t is for 'terminal' (uses 'neoterm') and 'minitest'
leader_nmap.t = {
  ['name'] = '+terminal/minitest',
  ['a'] = { '<Cmd>lua MiniTest.run()<CR>',                   'test run all' },
  ['f'] = { '<Cmd>lua MiniTest.run_file()<CR>',              'test run file' },
  ['l'] = { '<Cmd>lua MiniTest.run_at_location()<CR>',       'test run location' },
  ['s'] = { '<Cmd>lua minitest_screenshots.browse()<CR>', 'test show screenshot' },
  ['T'] = { '<Cmd>belowright Tnew<CR>',                      'terminal (horizontal)' },
  ['t'] = { '<Cmd>vertical Tnew<CR>',                        'terminal (vertical)' },
}

-- T is for 'test'
leader_nmap.T = {
  ['name'] = '+test',
  ['F'] = { [[<Cmd>TestFile -strategy=make | copen<CR>]],    'file (quickfix)' },
  ['f'] = { [[<Cmd>TestFile<CR>]],                           'file' },
  ['L'] = { [[<Cmd>TestLast -strategy=make | copen<CR>]],    'last (quickfix)' },
  ['l'] = { [[<Cmd>TestLast<CR>]],                           'last' },
  ['N'] = { [[<Cmd>TestNearest -strategy=make | copen<CR>]], 'nearest (quickfix)' },
  ['n'] = { [[<Cmd>TestNearest<CR>]],                        'nearest' },
  ['S'] = { [[<Cmd>TestSuite -strategy=make | copen<CR>]],   'suite (quickfix)' },
  ['s'] = { [[<Cmd>TestSuite<CR>]],                          'suite' },
}

-- stylua: ignore end

-- Make mappings manually to not depend on which-key (because it might not be
-- available for some reason, like when run inside VS Code)
local default_opts = {
  noremap = true,
  silent = true,
  expr = false,
  nowait = false,
  script = false,
  unique = false,
}

local function map_leader_tree(tree, mode, prefix)
  if type(tree) ~= 'table' then return end

  prefix = prefix or ''

  if type(tree[1]) == 'string' then
    local tree_opts = {
      noremap = tree.noremap,
      silent = tree.silent,
      expr = tree.expr,
      nowait = tree.nowait,
      script = tree.script,
      unique = tree.unique,
    }
    local opts = vim.tbl_deep_extend('force', default_opts, tree_opts)
    vim.api.nvim_set_keymap(mode, string.format('<Leader>%s', prefix), tree[1], opts)
    return
  end

  for key, t in pairs(tree) do
    if key ~= 'name' then map_leader_tree(t, mode, prefix .. key) end
  end
end

map_leader_tree(leader_nmap, 'n')
map_leader_tree(leader_xmap, 'x')
]=]
