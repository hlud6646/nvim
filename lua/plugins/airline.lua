return {
  {
    'vim-airline/vim-airline',
    dependencies = {
      'vim-airline/vim-airline-themes',
      'nvim-tree/nvim-web-devicons', -- For file icons
      'rebelot/kanagawa.nvim',
    },
    config = function()
      -- General Airline Settings
      vim.g.airline_powerline_fonts = 1
      
      -- Enable the top tabline
      vim.g['airline#extensions#tabline#enabled'] = 1
      vim.g['airline#extensions#tabline#formatter'] = 'unique_tail'
      
      -- Theme (kanagawa is compatible, or use 'dark')
      vim.g.airline_theme = 'kanagawa' 
      
      -- Haskell / LSP Integration
      -- Airline will automatically show LSP diagnostics (errors/warnings)
    end
  }
}
