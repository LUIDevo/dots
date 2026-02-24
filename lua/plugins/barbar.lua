return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function() vim.g.barbar_auto_setup = false end,
	auto_hide = false,
  opts = {
    auto = {
      enable = true,
      mode = "number",
    },
		icons = {
			buffer_index = true,
		},
  },
-- Close
  version = '^1.0.0',
}
