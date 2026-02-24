-- LUIDEVO NVIM CONFIG
vim.opt.clipboard:append("unnamedplus")
vim.opt.number=true
vim.wo.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true

-- Leader key
vim.g.mapleader = " "

-- Switch buffers like "tabs"
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

-- Lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load Lazy configuration
require("lazy-nvim")
--require("lazy").setup("lazy-nvim")

require("okcolors").setup({
    variant = "sharp", -- "smooth" or "sharp", defaults to "smooth"
})
vim.cmd.colorscheme("catppuccin")
--vim.cmd.colorscheme("tokyonight-night")
require('render-markdown').enable()
require('daily_note')

local status_ok, notify = pcall(require, "notify")
if status_ok then
  vim.notify = notify
end

-- Sort Buffers Automatically
vim.api.nvim_create_autocmd("BufAdd", {
  callback = function()
    vim.schedule(function()
      vim.cmd("BufferOrderByBufferNumber")
    end)
  end,
})

require 'colorizer'.setup()

-- Hop.nvim configuration
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.api.nvim_set_keymap('', 's', ":HopWord<CR>", { noremap = true })

-- Load keymaps
require("keymaps").setup()

-- Kill the specific highlight group causing the underlines
vim.api.nvim_set_hl(0, "@lsp.type.unresolvedReference", { underline = false, sp = "none" })
vim.api.nvim_set_hl(0, "@lsp.type.unresolvedReference.rust", { underline = false, sp = "none" })


-- Link them to a normal variable color so they look normal but don't underline
vim.cmd("hi! link @lsp.type.unresolvedReference Normal")
