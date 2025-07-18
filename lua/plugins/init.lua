return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      local dap = require("dap")
      -- 여기서 설정 가능 (예: keymap은 따로)
    end,
  },
  
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  --   'mrcjkb/rustaceanvim',
  --   version = '^6', -- Recommended
  --   lazy = false, -- This plugin is already lazy
  --   ft = "rust",
  --   config = function ()
  --     local mason_registry = require('mason-registry')
  --     local codelldb = mason_registry.get_package("codelldb")
  --     local extension_path = codelldb:get_install_path() .. "/extension/"
  --     local codelldb_path = extension_path .. "adapter/codelldb"
  --     local liblldb_path = extension_path.. "lldb/lib/liblldb.dylib"
	-- -- If you are on Linux, replace the line above with the line below:
	-- -- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
  --     local cfg = require('rustaceanvim.config')

  --     vim.g.rustaceanvim = {
  --       dap = {
  --         adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
  --       },
  --     }
  --   end
  -- },
  {
    "mrcjkb/rustaceanvim",
    version = "^4", -- optional
    ft = { "rust" },
    init = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, bufnr)
            -- example: format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format()
              end,
            })
          end,
        },
      }
    end,
  },
  

  {
    'rust-lang/rust.vim',
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  {
    'mfussenegger/nvim-dap',
    config = function()
			local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
		end,
  },

  {
    'rcarriga/nvim-dap-ui', 
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function()
			require("dapui").setup()
		end,
  },

  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true
          },
        },
      }
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
    end
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
  -- {
  --   "rcarriga/nvim-notify",
  --   config = function()
  --     local notify = require("notify")
  --     notify.setup({
  --       stages = "fade_in_slide_out",
  --       timeout = 3000,
  --       background_colour = "#1e1e2e",
  --     })
  --     vim.notify = notify
  --   end,
  -- },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("configs.nvim-notify")
    end,
  },
}