local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
require('lsp_shared').setup(bufnr)

-- <leader>h — Haskell tools
vim.keymap.set('n', '<leader>hh', ht.hoogle.hoogle_signature, { buffer = bufnr, desc = "Hoogle search" })
vim.keymap.set('n', '<leader>hr', ht.repl.toggle, { buffer = bufnr, desc = "REPL toggle" })
vim.keymap.set('n', '<leader>he', ht.lsp.buf_eval_all, { buffer = bufnr, desc = "Eval all" })
vim.keymap.set('n', '<leader>hp', ht.project.open_project_file, { buffer = bufnr, desc = "Open project file" })
