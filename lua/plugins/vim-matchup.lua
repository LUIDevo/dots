return {
	'andymass/vim-matchup',
	event = 'VeryLazy', -- Only load when needed
	enabled = false,
	config = function()
		-- Optional: Disable Neovim's built-in matchparen if you want vim-matchup to handle everything
		vim.g.loaded_matchparen = 1
	end,
}
