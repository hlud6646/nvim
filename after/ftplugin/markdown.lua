local bufnr = vim.api.nvim_get_current_buf()

-- New checkbox line below, cursor ready to type
vim.keymap.set('n', '<leader>mn', 'o- [ ] ', { buffer = bufnr, desc = "New checkbox" })

-- Check the checkbox on the current line
vim.keymap.set('n', '<leader>mx', function()
  local line = vim.api.nvim_get_current_line()
  local new_line = line:gsub('%[ %]', '[x]', 1)
  vim.api.nvim_set_current_line(new_line)
end, { buffer = bufnr, desc = "Check checkbox" })
