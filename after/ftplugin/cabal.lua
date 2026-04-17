local ht = require('haskell-tools')
local opts = { noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() }
vim.keymap.set('n', '<leader>pf', ht.project.open_project_file, opts)
