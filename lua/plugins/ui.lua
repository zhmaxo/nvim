return {
  {
    'akinsho/bufferline.nvim',
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
  ---- --[[
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight-storm]])
     end,
     },
  ---- ]]--

  {
    'folke/which-key.nvim',
    opts = {
      defaults = {
      }
    },
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      wk = require('which-key')
      wk.register({
        --
        ['<leader>b'] = { name = '+buffer' },
        ['<leader>f'] = { name = '+files/find' },
        ['<leader>q'] = { name = '+quit/session' },
        ['<leader>u'] = { name = '+utils' },
        ['<leader>w'] = { name = '+wiki' },
      })
      wk.setup({
        --
      })
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = {},
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require("lualine").setup()
    end,
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    keys = {
      { '<leader>fb', '<cmd>Oil<cr>', desc = 'browse with oil' },
    },
    -- dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require("oil").setup()
    end,
  }
}
