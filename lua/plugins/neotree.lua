return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				use_libuv_file_watcher = true,
			},
			buffers = {
				follow_current_file = {
					enabled = true,
				},
			},
		})
		vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true })
	end,
	lazy = false, -- neo-tree will lazily load itself
}
