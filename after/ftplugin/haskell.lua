local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr }

-- haskell-tools v7 specific functionality
vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature, opts)
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, opts)
vim.keymap.set('n', '<leader>ea', ht.lsp.buf_eval_all, opts)

-- Navigation / LSP
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

-- Show diagnostic popup on 'gl' (Get Line error)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { buffer = bufnr, desc = "Show Line Error" })

-- Jump between errors
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr })

-- This makes hover windows and diagnostics look much better
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { border = "rounded" }
)

-- Better icons in the gutter
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }
for type, icon in pairs(signs) do
  local name = "DiagnosticSign" .. type
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end
