return {
  {
    "catppuccin/nvim",
    -- enabled = false,
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end
  },

  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "rebelot/kanagawa.nvim",
    priority = 1000, -- Ensure it loads first
    lazy = false,
    enabled = false,
    config = function()
      -- vim.cmd("colorscheme onedark")
      vim.cmd.colorscheme("kanagawa")
    end
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    lazy = false,
    enabled = false,
    config = function()
      -- vim.cmd("colorscheme onedark")
      vim.cmd.colorscheme("onedark")
      require("onedarkpro").setup({
        plugins = {
          nvim_tree = false,
        }
      })
    end
  },

  {
    "RRethy/nvim-base16",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd([[colorscheme base16-ayu-mirage]])
      vim.cmd.colorscheme("base16-onedark")
    end
  },

  {
    "jayden-chan/base46.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      -- exit if it can't be found
      local present, base46 = pcall(require, "base46")
      if not present then
        return
      end

      -- local theme = "github_dark"
      -- local theme = "decay"
      local theme = "onedark"
      local color_base = "base46"

      local theme_opts = {
        base = color_base,
        theme = theme,
        transparency = false,
      }

      base46.load_theme(theme_opts)
    end
  },

}
