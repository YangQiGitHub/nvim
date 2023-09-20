return {

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "lua",
        "json",
        "javascript",
        "typescript",
        "html",
        "tsx",
        "css",
        "bash",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>", -- backspace
        },
      },
      -- rainbow = {
      --   enable = true,
      --   -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      --   extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      --   max_file_lines = nil, -- Do not enable for files with more than n lines, int
      --   -- colors = {}, -- table of hex strings
      --   -- termcolors = {} -- table of colour name strings
      -- },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },

  -- { "mrjones2014/nvim-ts-rainbow" },
}
