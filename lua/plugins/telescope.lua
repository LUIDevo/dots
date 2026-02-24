return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup()

		local pickers = require("telescope.pickers")
		local finders = require("telescope.finders")
		local conf = require("telescope.config").values
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		local plugin_colorschemes = { "catppuccin", "oxocarbon","solarized-osaka", "okcolors", "wheat-fox", "tokyonight-night", "onedark", "decay", "mountain", "pastelbeans", "hubbamax", "moonfly", "vesper", "oh-lucy-evening", "oldworld", "monoglow", "carbonfox", "mellow", "zenbones", "lackluster", "ashen" } -- only installed theme

		vim.keymap.set("n", "<leader>th", function()
			pickers.new({}, {
				prompt_title = "Installed Themes",
				finder = finders.new_table { results = plugin_colorschemes },
				sorter = conf.generic_sorter({}),
				attach_mappings = function(prompt_bufnr, map)
					actions.select_default:replace(function()
						local selection = action_state.get_selected_entry()
						vim.cmd("colorscheme " .. selection.value)
						actions.close(prompt_bufnr)
					end)
					return true
				end,
			}):find()
		end)
	end,
}
