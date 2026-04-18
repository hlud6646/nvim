-- Buffer navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true })
vim.keymap.set('n', '<Del>', ':bdelete<CR>', { silent = true }) -- forward-delete / other keyboards
vim.keymap.set('n', '<BS>', ':bdelete<CR>', { silent = true })  -- Mac delete key

-- Diagnostics
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Show line diagnostic" })

-- Flash current line
vim.keymap.set('n', '<leader><leader>', function()
  local ns = vim.api.nvim_create_namespace('flash_line')
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  vim.api.nvim_buf_add_highlight(0, ns, 'IncSearch', line, 0, -1)
  vim.defer_fn(function()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
  end, 300)
end, { desc = "Flash current line" })

-- Clear search highlights and dismiss Noice popups
vim.keymap.set('n', '<Esc>', function()
  vim.cmd('nohlsearch')
  require('noice').cmd('dismiss')
end, { silent = true })
