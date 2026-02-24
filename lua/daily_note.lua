-- daily_note.lua
-- Place this somewhere in your Neovim config (e.g. ~/.config/nvim/lua/daily_note.lua)

local M = {}

--- Create or open today's daily note in Obsidian vault and open in a new tab
M.open_daily_note = function()
  -- adjust these to match your Obsidian setup
  local vault_path = vim.fn.expand("~/vault")
  local dailies_subdir = "notes/dailies"

  -- build full directory & file paths
  local daily_dir = vault_path .. "/" .. dailies_subdir
  local today = os.date("%Y-%m-%d")
  local file_path = daily_dir .. "/" .. today .. ".md"

  -- ensure the dailies directory exists
  if vim.fn.isdirectory(daily_dir) == 0 then
    vim.fn.mkdir(daily_dir, "p")
  end

  -- if file doesn't exist, create with a H1 header and template sections
  if vim.fn.filereadable(file_path) == 0 then
    local header = "# " .. os.date("%B %d, %Y")
    local lines = {
      header,
      "",
      "## Tasks:",
      "",
      "## Habits:",
      "- [ ] Complete a leetcode problem",
      "- [ ] Read the Bible",
      "",
      "# Day planner",
      "",
      "# Web Activity",
      ""
    }
    vim.fn.writefile(lines, file_path)
  end

  -- open the file in a new tab
vim.cmd("edit " .. vim.fn.fnameescape(file_path))
end

--- Open yesterday's daily note if it exists, or notify the user
M.open_yesterday_note = function()
  local vault_path = vim.fn.expand("~/vault")
  local dailies_subdir = "notes/dailies"
  local daily_dir = vault_path .. "/" .. dailies_subdir

  -- Get yesterday's date
  local time = os.time() - (60 * 60 * 24) -- subtract one day
  local yesterday = os.date("%Y-%m-%d", time)
  local file_path = daily_dir .. "/" .. yesterday .. ".md"

  if vim.fn.filereadable(file_path) == 1 then
vim.cmd("edit " .. vim.fn.fnameescape(file_path))
  else
    vim.notify("No daily note found for yesterday (" .. yesterday .. ")", vim.log.levels.WARN)
  end
end
-- create a user command :DailyNote for easy access
vim.api.nvim_create_user_command('DailyNote', function()
  M.open_daily_note()
end, {
  desc = 'Create (if needed) and open today\'s daily note in a new tab',
})

vim.api.nvim_create_user_command('YesterdayNote', function()
  M.open_yesterday_note()
end, {
  desc = 'Open yesterday\'s daily note in a new tab (if it exists)',
})

return M
