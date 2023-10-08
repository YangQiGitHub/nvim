return {

  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function()
      -- local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find existing buffers" })
      vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Grep"})
      vim.keymap.set("n", "<leader>:", builtin.command_history, { desc = "Command History" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files"})
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files"})

      -- git
      vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
      vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })

      require("telescope").setup({
        defaults = {
          -- border = true,
          -- file_sorter = require('telescope.sorters').get_fzy_sorter,
          -- initial_mode = "normal",
          color_devicons = true,
          file_previewer = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
          prompt_prefix = "  ",
          selection_caret = " ",
          -- prompt_prefix = " ",
          -- selection_caret = " ",
          path_display = { "smart" },
        },
        mappings = {
          -- i = {
          --   ["<C-n>"] = actions.cycle_history_next,
          --   ["<C-p>"] = actions.cycle_history_prev,
          --
          --   ["<C-j>"] = actions.move_selection_next,
          --   ["<C-k>"] = actions.move_selection_previous,
          --
          --   ["<C-c>"] = actions.close,
          --
          --   ["<Down>"] = actions.move_selection_next,
          --   ["<Up>"] = actions.move_selection_previous,
          --
          --   ["<CR>"] = actions.select_default,
          --   ["<C-x>"] = actions.select_horizontal,
          --   ["<C-v>"] = actions.select_vertical,
          --   ["<C-t>"] = actions.select_tab,
          --
          --   ["<C-u>"] = actions.preview_scrolling_up,
          --   ["<C-d>"] = actions.preview_scrolling_down,
          --
          --   ["<PageUp>"] = actions.results_scrolling_up,
          --   ["<PageDown>"] = actions.results_scrolling_down,
          --
          --   ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          --   ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          --   ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          --   ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          --   ["<C-l>"] = actions.complete_tag,
          --   -- ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          -- },

          -- n = {
          --   ["<esc>"] = actions.close,
          --   ["<CR>"] = actions.select_default,
          --   ["<C-x>"] = actions.select_horizontal,
          --   ["<C-v>"] = actions.select_vertical,
          --   ["<C-t>"] = actions.select_tab,
          --
          --   ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          --   ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          --   ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          --   ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          --
          --   ["j"] = actions.move_selection_next,
          --   ["k"] = actions.move_selection_previous,
          --   ["H"] = actions.move_to_top,
          --   ["M"] = actions.move_to_middle,
          --   ["L"] = actions.move_to_bottom,
          --
          --   ["<Down>"] = actions.move_selection_next,
          --   ["<Up>"] = actions.move_selection_previous,
          --   ["gg"] = actions.move_to_top,
          --   ["G"] = actions.move_to_bottom,
          --
          --   ["<C-u>"] = actions.preview_scrolling_up,
          --   ["<C-d>"] = actions.preview_scrolling_down,
          --
          --   ["<PageUp>"] = actions.results_scrolling_up,
          --   ["<PageDown>"] = actions.results_scrolling_down,
          --
          --   ["?"] = actions.which_key,
          -- },
        },

        pickers = {
          command_history = {
            initial_mode = "normal",
          },
          git_status = {
            initial_mode = "normal",
          },
          git_commits = {
            initial_mode = "normal",
          },
          lsp_references = {
            initial_mode = "normal",
          }
        },
      })

      local TelescopePrompt = {
        TelescopeBorder = {
          fg = "#ffffff",
        },
        TelescopePromptBorder = {
          fg = "#ffffff",
        },
      }
      for hl, col in pairs(TelescopePrompt) do
        vim.api.nvim_set_hl(0, hl, col)
      end
    end
  },

}
