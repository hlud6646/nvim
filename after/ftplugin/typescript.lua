local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }

-- typescript-tools specific functionality
vim.keymap.set('n', '<leader>ti', ':TSToolsOrganizeImports<CR>', { buffer = bufnr, desc = "Organize imports" })
vim.keymap.set('n', '<leader>ta', ':TSToolsAddMissingImports<CR>', { buffer = bufnr, desc = "Add missing imports" })
vim.keymap.set('n', '<leader>tf', ':TSToolsFixAll<CR>', { buffer = bufnr, desc = "Fix all" })
vim.keymap.set('n', '<leader>tr', ':TSToolsRenameFile<CR>', { buffer = bufnr, desc = "Rename file" })
vim.keymap.set('n', '<leader>ts', ':TSToolsGoToSourceDefinition<CR>', { buffer = bufnr, desc = "Go to source definition" })

-- Navigation / LSP
vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = "rounded" }) end, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

-- Show diagnostic popup on 'gl' (Get Line error)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { buffer = bufnr, desc = "Show Line Error" })

-- Jump between errors
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr })

-- Better icons in the gutter
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }
for type, icon in pairs(signs) do
  local name = "DiagnosticSign" .. type
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end
