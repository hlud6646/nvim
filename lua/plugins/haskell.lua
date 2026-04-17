return {
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^7',
    lazy = false, -- Required: ftplugin handles loading
    ft = { 'haskell', 'lhaskell', 'cabal', 'stack.yaml' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      vim.g.haskell_tools = {
        hls = {
          settings = {
            haskell = {
              formattingProvider = 'ormolu',
              checkProject = true,
            }
          }
        }
      }
    end,
  },
}
