require("core.options")
require("core.keymaps")

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  {
    "RRethy/nvim-base16",
    lazy = false,
    priority = 1000,
    config = function()
	    -- vim.cmd.colorscheme("base16-catppuccin")
      vim.cmd([[colorscheme base16-ayu-mirage]])
    end,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
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
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              -- separator = true
            }
          }
        }
      })
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    -- config = function()
    --   require("indent_blankline").setup {
    --     show_current_context = true,
    --     show_current_context_start = true,
    --   }
    -- end
  },

  {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
      require("mini.pairs").setup()
    end
  },

  { "echasnovski/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup()
    end
  },

  -- {
  --   "echasnovski/mini.comment",
  --   version = false,
  --   config = function()
  --     require("mini.comment").setup()
  --   end
  -- },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },

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

      require("nvim-tree").setup ({
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
  }
})
