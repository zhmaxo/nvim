return {
  {
    'phaazon/hop.nvim',
    config = function()
      require'hop'.setup()
    end
  },
	-- telescope
	{ 'nvim-telescope/telescope.nvim' },

	-- telescope fzf
	{
		'telescope.nvim',
		dependencies = {
			'nvim-telescope/telescope-fzf-native.nvim',
			--[[ config = function()
				require('telescope').load_extension('fzf')
			end,
			]]--
		},
	},
}
