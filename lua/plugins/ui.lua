return {
	---- --[[
	-- cool colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight-storm]])
		end,
	},
	---- ]]--

	-- buffers show as tabs
	{
		"akinsho/bufferline.nvim",
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
					local icons = require("core.config").icons.diagnostics
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

	-- bottom pretty line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("lualine").setup()
		end,
	},

	-- explore filesystem
	{
		"stevearc/oil.nvim",
		opts = {
			vertical = true,
			split = botright,
		},
		keys = {
			{ "<leader>fe", "<cmd>Oil<cr>", desc = "explore with oil" },
			{ "<leader>fE", "<cmd>vsplit Oil<cr>", desc = "vsplit exploere with oil" },
		},
		-- dependencies = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require("oil").setup()
		end,
	},

	-- display available combinations for pressed key in chain
	{
		"folke/which-key.nvim",
		opts = {
			defaults = {},
		},
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
			wk = require("which-key")
			wk.register({
				--
				["<leader>b"] = { name = "+buffer" },
				["<leader>f"] = { name = "+files/find" },
				["<leader>q"] = { name = "+quit/session" },
				["<leader>u"] = { name = "+utils" },
				["<leader>w"] = { name = "+wiki" },
				["<leader>z"] = { name = "+zettel" },
				["<leader>ca"] = { name = "+calenar" },
			})
			wk.setup({
				--
			})
		end,
	},

	-- hex colorizer. TODO: make it work
	{
		"norcalli/nvim-colorizer.lua",
		config = {},
	},

	-- greeter
	{
		"echasnovski/mini.starter",
		version = false,
		event = "VimEnter",
		--[[
    opts = function()
      local logo = table.concat({
      '  ███████ ██   ██ ███    ███  █████  ██   ██  ██████   ',
      '     ███  ██   ██ ████  ████ ██   ██  ██ ██  ██    ██  ',
      '    ███   ███████ ██ ████ ██ ███████   ███   ██    ██  ',
      '   ███    ██   ██ ██  ██  ██ ██   ██  ██ ██  ██    ██  ',
      '  ███████ ██   ██ ██      ██ ██   ██ ██   ██  ██████   ',
      '                                                       ',
      '                                                       ',
      '          ███    ██ ██    ██ ██ ███    ███             ',
      '          ████   ██ ██    ██ ██ ████  ████             ',
      '          ██ ██  ██ ██    ██ ██ ██ ████ ██             ',
      '          ██  ██ ██  ██  ██  ██ ██  ██  ██             ',
      '          ██   ████   ████   ██ ██      ██             '
      }, '\n')
      local pad = string.rep(' ', 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require'mini.starter'
      local config = {
        evaluate_single = true,
        header = logo,
        items = {
          new_section('Find file', 'Telescope find_files', 'Telescope'),
          new_section('Recent files', 'Telescope oldfiles', 'Telescope'),
          new_section('Grep text', 'Telescope live_grep', 'Telescope'),
          new_section('init.lua', 'e $MYVIMRC', 'Config'),
        },
      }
      return config
    end,
    ]]
		--
		config = function() --function(_, config)
			-- close Lazy and re-open when starter is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "MiniStarterOpened",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			local starter = require("mini.starter")
			starter.setup({
				evaluate_single = true,
				items = {
					starter.sections.builtin_actions(),
					starter.sections.recent_files(10, false),
					starter.sections.recent_files(10, true),
				},
				content_hooks = {
					starter.gen_hook.adding_bullet(), --(pad .. '░ ', false),
					starter.gen_hook.indexing("all", { "Builtin actions" }),
					starter.gen_hook.padding(3, 2),
				},
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					local pad_footer = string.rep(" ", 8)
					starter.config.footer = pad_footer
						.. "⚡ Neovim loaded "
						.. stats.count
						.. " plugins in "
						.. ms
						.. "ms"
					pcall(starter.refresh)
				end,
			})
		end,
	},

	--[[
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    -- NO NEEDED: already has icons
    -- dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = { require'alpha.themes.startify'.config }
  },
  ]]
	--
}
