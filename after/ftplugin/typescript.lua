local bufnr = vim.api.nvim_get_current_buf()
require('lsp_shared').setup(bufnr)

-- <leader>t — TypeScript tools
vim.keymap.set('n', '<leader>ti', ':TSToolsOrganizeImports<CR>', { buffer = bufnr, desc = "Organize imports" })
vim.keymap.set('n', '<leader>ta', ':TSToolsAddMissingImports<CR>', { buffer = bufnr, desc = "Add missing imports" })
vim.keymap.set('n', '<leader>tf', ':TSToolsFixAll<CR>', { buffer = bufnr, desc = "Fix all" })
vim.keymap.set('n', '<leader>tr', ':TSToolsRenameFile<CR>', { buffer = bufnr, desc = "Rename file" })
vim.keymap.set('n', '<leader>ts', ':TSToolsGoToSourceDefinition<CR>', { buffer = bufnr, desc = "Go to source definition" })
