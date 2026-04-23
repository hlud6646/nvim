-- Buffer navigation
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true })
local function close_buffer()
  local bufs = vim.tbl_filter(function(b)
    return vim.bo[b].buflisted and b ~= vim.api.nvim_get_current_buf()
  end, vim.api.nvim_list_bufs())
  if #bufs > 0 then
    vim.cmd('bnext')
  end
  vim.cmd('bdelete #')
end

vim.keymap.set('n', '<Del>', close_buffer, { silent = true }) -- forward-delete / other keyboards
vim.keymap.set('n', '<BS>', close_buffer, { silent = true })  -- Mac delete key

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
