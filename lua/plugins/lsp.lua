return {

  {
    "williamboman/mason.nvim",
    lazy = true,
    config = function()
      -- print("1 mason")
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          },
          border = "single",
        }
      })
    end
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = {
      ensure_installed = { "lua_ls", "jsonls", "html", "yamlls" }
      -- ensure_installed = { "lua_ls", "jsonls", "html", "gopls" }
      -- ensure_installed = { "lua_ls", "gopls" }
    },
    config = function(_, opts)
      -- print("2 mason-lspconfig")
      require("mason-lspconfig").setup(opts)
    end
  },

  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      servers = {
        lua_ls = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        },
      },
    },
    config = function(_, opts)
      -- print("3 nvim-lspconfig")
      -- Diagnostic keymaps
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
      -- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
      vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
        nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        -- See `:help K` for why this keymap
        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        -- TODO: 按键冲突
        -- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
        nmap("gK", vim.lsp.buf.signature_help, "Signature Documentation")

        -- Lesser used LSP functionality
        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
        nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
        nmap("<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "[W]orkspace [L]ist Folders")

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
          vim.lsp.buf.format()
        end, { desc = "Format current buffer with LSP" })
      end

      -- local servers = {
      --   lua_ls = {
      --     Lua = {
      --       diagnostics = {
      --         globals = { "vim" }
      --       }
      --     }
      --   }
      -- }

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = lsp_capabilities,
            settings = opts.servers[server_name],
            on_attach = on_attach
          })
        end,
      })
    end
  },
}
