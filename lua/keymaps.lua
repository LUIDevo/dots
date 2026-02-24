-- keymaps.lua
local M = {}

function M.setup()
  -- Telescope keymaps
  vim.keymap.set("n", "<leader>fa", function()
    require("telescope.builtin").find_files({ cwd = vim.loop.cwd() })
  end, { desc = "Find files in cwd" })

  vim.keymap.set("n", "<leader>fw", function()
    require("telescope.builtin").live_grep({ cwd = vim.loop.cwd() })
  end, { desc = "Search words in cwd" })

  vim.keymap.set("n", "<leader>fz", function()
    require("telescope.builtin").current_buffer_fuzzy_find()
  end, { desc = "Search words in current file" })


vim.keymap.set("n", "<leader>x", ":BufferClose<CR>", { silent = true, nowait = true })

	-- Move buffers
	vim.keymap.set("n", "<A-,>", ":BufferMovePrevious<CR>", { silent = true })
	vim.keymap.set("n", "<A-.>", ":BufferMoveNext<CR>", { silent = true })

	-- Pick buffer by number
	vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
	vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
	vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
	vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 3<CR>")
	vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 3<CR>")
	vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>")

-- Maps <leader>i to insert a checkbox at the cursor position
vim.keymap.set("n", "<leader>i", "i- [ ] <Esc>A", { desc = "Insert Checkbox" })

	-- diagnostics for current buffer
	vim.keymap.set("n", "<leader>ds", function()
		vim.diagnostic.setloclist({open = true})
	end, { desc = "Diagnostics: Show file errors" })

vim.keymap.set("n", "<leader>dz", "<cmd>Telescope diagnostics bufnr=0<CR>", {
  desc = "Diagnostics: Show errors in current file"
})
end

return M
