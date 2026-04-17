vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Basic Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true

vim.opt.cursorline = true       -- Highlight the current line
vim.opt.laststatus = 3          -- Global statusline (looks cleaner)
vim.opt.showmode = false        -- Don't show --INSERT-- (Airline does this)
vim.opt.pumheight = 10          -- Limit completion menu height
vim.opt.splitright = true       -- Better window splitting
vim.opt.splitbelow = true
vim.opt.fillchars = { eob = " " } -- Hide the ~ on empty lines

-- Normal Mode Navigation
-- Tab to go to the next buffer
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
-- Add these to your init.lua settings block
vim.opt.termguicolors = true
vim.opt.laststatus = 3         -- Global status line
vim.opt.showmode = false       -- Mode is shown in Lualine
vim.opt.cursorline = true      -- Highlight current line
vim.opt.fillchars = { eob = " " } -- Clean end-of-buffer


-- Shift-Tab to go to the previous buffer
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true })

-- Delete key to close the current buffer
vim.keymap.set('n', '<Del>', ':bdelete<CR>', { silent = true })
-- Quick visual check for errors
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Show line error" })

-- Double-space to flash current line
vim.keymap.set('n', '<leader><leader>', function()
  local ns = vim.api.nvim_create_namespace('flash_line')
  local line = vim.api.nvim_win_get_cursor(0)[1] - 1
  vim.api.nvim_buf_add_highlight(0, ns, 'IncSearch', line, 0, -1)
  vim.defer_fn(function()
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
  end, 300)
end, { desc = "Flash current line" })

-- Diagnostic Display Configuration
vim.diagnostic.config({
  virtual_text = { prefix = '●' },
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

-- Clear search highlights and dismiss Noice popups (e.g. [3/4] count) with Escape
vim.keymap.set('n', '<Esc>', function()
  vim.cmd('nohlsearch')
  require('noice').cmd('dismiss')
end, { silent = true })

-- Auto-reload files changed outside of Neovim
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  command = 'checktime',
})

-- Bootstrap lazy.nvim (Configured to use hnvim directory)
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  root = vim.fn.stdpath('data') .. '/lazy',
})
