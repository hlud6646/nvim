vim.g.format_on_save = true

return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  keys = {
    {
      '<leader>uf',
      function()
        vim.g.format_on_save = not vim.g.format_on_save
        vim.notify('Format on save: ' .. (vim.g.format_on_save and 'ON' or 'OFF'))
      end,
      desc = 'Toggle format on save',
    },
  },
  opts = {
    formatters_by_ft = {
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      json = { 'prettier' },
    },
    format_on_save = function()
      if not vim.g.format_on_save then return end
      return { timeout_ms = 500, lsp_fallback = true }
    end,
  },
}
