return {

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      require("nvim-tree").setup({
        renderer = {
          indent_markers = {
            enable = true
          }
        }
      })
    end,
    keys = {
      {
        "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTreeToggle"
      }
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("lualine").setup(
        {
          options = { theme = "gruvbox" }
        }
      )
    end,
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true
            }
          }
        }
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        -- show_current_context_start = true,
      }
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    -- event = "UIEnter",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        direction = "float",
        float_opts = {
          border = "curved",
        }
      })
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {}
  },

}
