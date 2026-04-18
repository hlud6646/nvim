local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set('n', '<leader>hp', ht.project.open_project_file, { buffer = bufnr, desc = "Open project file" })
