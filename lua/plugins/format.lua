return {
  'stevearc/conform.nvim',
  keys = {
    {
      '<leader>cf',
      function() require('conform').format({ async = true, lsp_fallback = true }) end,
      mode = { 'n', 'v' },
      desc = 'Format',
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
  },
}
