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

  -- {
  --   "nvim-telescope/telescope.nvim",
  --   branch = "0.1.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   config = function ()
  --     local actions = require("telescope.actions")
  --
  --     require("telescope").setup({
  --       defaults = {
  --         -- border = true,
  --         -- file_sorter = require('telescope.sorters').get_fzy_sorter,
  --         color_devicons = true,
  --         file_previewer = require('telescope.previewers').vim_buffer_cat.new,
  --         grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
  --         qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
  --         prompt_prefix = " ",
  --         selection_caret = " ",
  --         path_display = { "smart" },
  --       },
  --       mappings = {
  --         i = {
  --           ["<C-n>"] = actions.cycle_history_next,
  --           ["<C-p>"] = actions.cycle_history_prev,
  --
  --           ["<C-j>"] = actions.move_selection_next,
  --           ["<C-k>"] = actions.move_selection_previous,
  --
  --           ["<C-c>"] = actions.close,
  --
  --           ["<Down>"] = actions.move_selection_next,
  --           ["<Up>"] = actions.move_selection_previous,
  --
  --           ["<CR>"] = actions.select_default,
  --           ["<C-x>"] = actions.select_horizontal,
  --           ["<C-v>"] = actions.select_vertical,
  --           ["<C-t>"] = actions.select_tab,
  --
  --           ["<C-u>"] = actions.preview_scrolling_up,
  --           ["<C-d>"] = actions.preview_scrolling_down,
  --
  --           ["<PageUp>"] = actions.results_scrolling_up,
  --           ["<PageDown>"] = actions.results_scrolling_down,
  --
  --           ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
  --           ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
  --           ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
  --           ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
  --           ["<C-l>"] = actions.complete_tag,
  --           -- ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
  --         },
  --
  --         n = {
  --           ["<esc>"] = actions.close,
  --           ["<CR>"] = actions.select_default,
  --           ["<C-x>"] = actions.select_horizontal,
  --           ["<C-v>"] = actions.select_vertical,
  --           ["<C-t>"] = actions.select_tab,
  --
  --           ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
  --           ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
  --           ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
  --           ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
  --
  --           ["j"] = actions.move_selection_next,
  --           ["k"] = actions.move_selection_previous,
  --           ["H"] = actions.move_to_top,
  --           ["M"] = actions.move_to_middle,
  --           ["L"] = actions.move_to_bottom,
  --
  --           ["<Down>"] = actions.move_selection_next,
  --           ["<Up>"] = actions.move_selection_previous,
  --           ["gg"] = actions.move_to_top,
  --           ["G"] = actions.move_to_bottom,
  --
  --           ["<C-u>"] = actions.preview_scrolling_up,
  --           ["<C-d>"] = actions.preview_scrolling_down,
  --
  --           ["<PageUp>"] = actions.results_scrolling_up,
  --           ["<PageDown>"] = actions.results_scrolling_down,
  --
  --           ["?"] = actions.which_key,
  --         },
  --       },
  --
  --       pickers = { },
  --     })
  --
  --     local TelescopePrompt = {
  --       TelescopeBorder = {
  --         fg = "#ffffff",
  --       },
  --       TelescopePromptBorder = {
  --         fg = "#ffffff",
  --       },
  --     }
  --     for hl, col in pairs(TelescopePrompt) do
  --       vim.api.nvim_set_hl(0, hl, col)
  --     end
  --   end
  -- },

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
