-- Save this file as ~/.config/nvim/colors/pastelbeans.lua

-- Reset highlights
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "pastelbeans"

-- Define our Palette (From your provided base_30)
local colors = {
  bg         = "#151515",
  fg         = "#e8e8d3",
  cursor_line = "#1c1c1c",
  selection  = "#3a3a3a",
  comment    = "#525252",
  red        = "#ff9da4",
  green      = "#d1f1a9",
  yellow     = "#f5d595",
  blue       = "#bbdaff",
  purple     = "#ebbbff",
  cyan       = "#BBFFFF",
  orange     = "#ffb964",
  split      = "#2d2d2d",
}

-- Helper function to set highlights
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- --- Editor UI ---
hi("Normal",       { fg = colors.fg, bg = colors.bg })
hi("CursorLine",   { bg = colors.cursor_line })
hi("Visual",       { bg = colors.selection })
hi("LineNr",       { fg = colors.comment })
hi("CursorLineNr", { fg = colors.yellow })
hi("VertSplit",    { fg = colors.split, bg = "NONE" })
hi("WinSeparator", { fg = colors.split, bg = "NONE" })
hi("Pmenu",        { fg = colors.fg, bg = colors.cursor_line })
hi("PmenuSel",     { fg = colors.bg, bg = colors.blue })
hi("Search",       { fg = colors.bg, bg = colors.yellow })

-- --- Syntax Highlighting ---
hi("Comment",      { fg = colors.comment, italic = true })
hi("Constant",     { fg = colors.orange })
hi("String",       { fg = colors.green })
hi("Identifier",   { fg = colors.blue })
hi("Function",     { fg = colors.blue })
hi("Statement",    { fg = colors.purple })
hi("PreProc",      { fg = colors.cyan })
hi("Type",         { fg = colors.yellow })
hi("Special",      { fg = colors.orange })
hi("Error",        { fg = colors.bg, bg = colors.red })
hi("Todo",         { fg = colors.bg, bg = colors.yellow })

-- --- Treesitter (Standard Modern Neovim) ---
hi("@variable",    { fg = colors.fg })
hi("@keyword",     { fg = colors.purple })
hi("@function",    { fg = colors.blue })
hi("@string",      { fg = colors.green })
hi("@operator",    { fg = colors.cyan })
hi("@parameter",   { fg = colors.red })
