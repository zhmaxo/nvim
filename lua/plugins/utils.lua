return {
	-- wiki!
  --[[
  ]]--
  {
    'vimwiki/vimwiki',
  },

  { 'renerocksai/calendar-vim'},

  {
    'renerocksai/telekasten.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function()
      -- despite the official wiki, only this way seems work to me
      local home = string.gsub(vim.fn.expand('~/zhmaxokasten'), '\\', '\\\\')
      local main = home .. '/main'
      local work = home .. '/work'

      require'telekasten'.setup{
        home = main,
        dailies = main .. '/daily',
        weeklies = main .. '/weekly',
        templates = home .. '/templates',
        image_subdir = 'img',

        vaults = {
          work = {
            home = work,
            dailies = work .. '/agenda',
            weeklies = work .. '/agenda',
          }
        }
      }

      -- Launch panel if nothing is typed after <leader>z
      vim.keymap.set("n", "<leader>zp", "<cmd>Telekasten panel<CR>")

      -- Most used functions
      vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
      vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
      vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
      vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
      vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
      vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
      vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
      vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

      -- Call insert link automatically when we start typing a link
      vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
    end
  },

  { 'nvim-lua/plenary.nvim', lazy = true },
}
