return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- LSP servers
    local servers = {
      lua_ls = {
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      },
      ts_ls = {},
      pyright = {},
    }

    -- Setup each server
    for server, opts in pairs(servers) do
      opts.capabilities = capabilities
      vim.lsp.config(server, opts)
    end

    -- Optional: LSP keymaps
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)
  end,
}
