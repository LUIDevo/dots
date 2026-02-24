return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "vim", "vimdoc", "html", "css", "svelte", "typescript", "java", "python","rust"},
			highlight = { enable = true },
		})
	end
}
