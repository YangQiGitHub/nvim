return {
  {
    "mrjones2014/smart-splits.nvim",
    config = function()
      -- recommended mappings
      -- resizing splits
      -- these keymaps will also accept a range,
      -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
      vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
      vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
      vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
      vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
      -- moving between splits
      vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
      vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
      vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
      vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
      -- swapping buffers between windows
      vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
      vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
      vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
      vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
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
          options = { theme = "onedark" }
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
          diagnostics = "nvim_lsp",
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

  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "VeryLazy",
  --   version = "2.20.8",
  --   config = function()
  --     require("indent_blankline").setup {
  --       show_current_context = true,
  --       -- show_current_context_start = true,
  --     }
  --   end,
  -- },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {
      indent = {
        -- char = "┊",
        -- tab_char = "┊",
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        highlight = { "Function", "Label" },
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    }
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

  -- smooth scrolling
  {
    "karb94/neoscroll.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {}
  },

  {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  },

  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },
}
