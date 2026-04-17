return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {
        view = { width = 30 },
        renderer = {
          indent_markers = { enable = true },
          icons = { show = { file = true, folder = true, git = true } },
        },
      }
      -- Toggle with <leader>e
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })
    end,
  },
}
