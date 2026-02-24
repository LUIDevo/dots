return {
  "startup-nvim/startup.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    require("startup").setup({
      header = {
        type = "text",
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
				content = {
					"",
					"",
					"",
					"",
					"",
					"",
					"",
					"",
					"",
					"███╗  ██╗██╗   ██╗██╗███╗  ███╗ ",
					"████╗ ██║██║   ██║██║████╗ ████║",
					"██╔██╗██║██║   ██║██║██╔████╔██║",
					"██║╚████║╚██╗ ██╔╝██║██║╚██╔╝██║",
					"██║ ╚███║ ╚████╔╝ ██║██║ ╚═╝ ██║",
					"╚═╝  ╚══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
					"",
					"stupidly simple; simply stupid",
				},
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
      },

					-- " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣶⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
					-- " ⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣄⣀⡀⣠⣾⡇⠀⠀⠀⠀",
					-- " ⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀",
					-- " ⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⢿⣿⣿⡇⠀⠀⠀⠀",
					-- " ⠀⣶⣿⣦⣜⣿⣿⣿⡟⠻⣿⣿⣿⣿⣿⣿⣿⡿⢿⡏⣴⣺⣦⣙⣿⣷⣄⠀⠀⠀",
					-- " ⠀⣯⡇⣻⣿⣿⣿⣿⣷⣾⣿⣬⣥⣭⣽⣿⣿⣧⣼⡇⣯⣇⣹⣿⣿⣿⣿⣧⠀⠀",
					-- " ⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠸⣿⣿⣿⣿⣿⣿⣿⣷⠀",
      body = {
        type = "mapping",
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 5,
        content = {
          { " Find File", "Telescope find_files", "f" },
          { " Find Word", "Telescope live_grep", "g" },
          { " Recent Files", "Telescope oldfiles", "r" },
          { " File Browser", "Telescope file_browser", "b" },
          { " Colorschemes", "Telescope colorscheme", "c" },
          { " New File", "lua require('startup').new_file()", "n" },
        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
      },

      footer = {
        type = "text",
        align = "center",
        fold_section = false,
        title = "Footer",
        margin = 5,
        content = {
          "startup.nvim",
        },
        highlight = "Number",
        default_color = "",
        oldfiles_amount = 0,
      },

      options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 3 },
      },

      mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<C-o>",
        open_section = "<TAB>",
        open_help = "?",
      },

      colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
      },

      parts = { "header", "body", "footer" },
    })
  end,
}
