return {
  -- 1. Modern Tabs (Bufferline)
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        mode = "buffers",
        separator_style = "slant", -- "slant" | "thick" | "thin"
        show_buffer_close_icons = false,
        always_show_bufferline = true,
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", padding = 1 }
        },
      }
    }
  },

  -- 2. Sleeker Statusline (Lualine)
  -- { 'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   opts = {
  --     options = {
        -- theme = 'kanagawa',
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
  --       globalstatus = true, -- One single status bar at the bottom
  --     },
  --   }
  -- },


  -- 3. Modern Command Line & Popups (Noice)
  -- This gives you floating command lines and smooth notifications
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
      },
    },
  },

  -- 4. Safe Buffer Delete (Prevents closing windows when closing tabs)
  { 'famiu/bufdelete.nvim' },
}
