return {
  {
    'pmizio/typescript-tools.nvim',
    lazy = false,
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
        },
        expose_as_code_action = { 'fix_all', 'add_missing_imports', 'remove_unused' },
      },
    },
  },
}
