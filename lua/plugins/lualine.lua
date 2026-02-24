return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    priority = 1000,
    config = function()

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand("%:p:h")
          local gitdir = vim.fn.finddir(".git", filepath .. ";")
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
        width_percent_below = function(n, thresh)
          local winwidth = vim.api.nvim_win_get_width(0)
          return n / winwidth <= thresh
        end,
      }

      -- FIXED: Simplified to an empty string so it just shows the icon
      local mainIcon = {
        function() return " " end,
        icon = "", -- Make sure your font supports this, otherwise try ""
        padding = 0,
      }

      local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info", "hint" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        colored = false,
        update_in_insert = true,
        always_visible = true,
        padding = 2,
      }

      -- FIXED: Replaced corrupted Chinese characters with Nerd Font icons
      local diff = {
        "diff",
        symbols = { added = " ", modified = " ", removed = " " },
        colored = true,
        cond = conditions.buffer_not_empty,
        padding = { left = 2, right = 2 },
      }

      local mode = {
        "mode",
        icon = " ",
        padding = { left = 2, right = 2 },
        color = { gui = "bold" },
      }

      local filetype = {
        "filetype",
        colored = false,
        icon_only = true,
        padding = { left = 2, right = 0 },
      }

      local filename = {
        "filename",
        padding = { left = 1, right = 2 },
      }

      local branch = {
        "branch",
        icons_enabled = true,
        icon = "",
        padding = { left = 2, right = 2 },
      }

      local progress = function()
        local current_line = vim.fn.line(".")
        local totalLines = vim.fn.line("$")
        if current_line == 1 then
          return "Top"
        elseif current_line == totalLines then
          return "Bot"
        else
          return "%p%%"
        end
      end

      local location = {
        progress,
        icon = "",
      }

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = "",
    section_separators = "",
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
    end,
  }
