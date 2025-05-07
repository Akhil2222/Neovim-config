return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},

	{
		"Mofiqul/vscode.nvim",
		config = function()
			require("vscode").setup()
			require("vscode").load('dark')
		end
	},
	{
    	'nvim-lualine/lualine.nvim',
		config = function()
			require("lualine").setup()
		end,
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.diagnostics.tsc,
					null_ls.builtins.diagnostics.cppcheck,
					null_ls.builtins.diagnostics.flake8,
					null_ls.builtins.completion.spell,
					null_ls.builtins.completion.brittany
				},
			})
		end
	},
	{
    	'nvim-telescope/telescope.nvim', tag = '0.1.5',
      	dependencies = { 'nvim-lua/plenary.nvim' }
    },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		config = function()
			-- local hooks = require("ipl.hooks")
			-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			-- 	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
			-- 	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
			-- 	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
			-- 	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
			-- 	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
			-- 	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
			-- 	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			-- end)
			require("ibl").setup({
				-- indent = {highlight = {"Whitespace", "CursorColumn"}},
				whitespace = {
					highlight = {"Whitespace", "CursorColumn"},
					remove_blankline_trail = false
				},
				scope = {
					enabled = true,
					show_start = true,
					highlight = "Number",
					include = {
						node_type = { ["*"] = {"*"}}
					}
				},
				
			})
		end,
		dependencies = {"nvim-treesitter"},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			vim.opt.termguicolors = true
			require('nvim-highlight-colors').setup({})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
		  local configs = require("nvim-treesitter.configs")

		  configs.setup({
			  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "typescript", "tsx", "jsx", "html", "haskell", "cpp", "java"},
			  sync_install = false,
			  highlight = { enable = true },
			  indent = { enable = true },  
			})
		end
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = {"nvim-lua/plenary.nvim"},
		config = function()
			vim.keymap.set("n", "<Return>", function()
				require("harpoon.ui").nav_next()
			end)
			vim.keymap.set("n", "<S-Return>", function()
				require("harpoon.ui").nav_prev()
			end)
			vim.keymap.set("n", "<F5>", function()
				require("harpoon.ui").toggle_quick_menu()
			end)
			vim.keymap.set("n", "<F6>", function()
				require("harpoon.mark").add_file()
			end)
			require("telescope").load_extension('harpoon')

		end
	},
	{
		 "folke/trouble.nvim",
		 dependencies = { "nvim-tree/nvim-web-devicons" },
		 opts = {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		 },
	},
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end
	},
	{
	  "folke/tokyonight.nvim",
	  opts = {},
	},
	{
		"mfussenegger/nvim-jdtls"
	},
	{
		'vscode-neovim/vscode-multi-cursor.nvim',
		event = 'VeryLazy',
		cond = not not vim.g.vscode,
		opts = {},
		lazy = true
	},
	{
		"mfussenegger/nvim-lsp-compl"
	},
	{
		'neoclide/coc.nvim', 
		branch = 'release',
	},
	{
	  'Julian/lean.nvim',
	  event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

	  dependencies = {
		'neovim/nvim-lspconfig',
		'nvim-lua/plenary.nvim',
		-- you also will likely want nvim-cmp or some completion engine
	  },

	  -- see details below for full configuration options
	  opts = {
		lsp = {},
		mappings = true,
	  }
	},
	{
		"f-person/git-blame.nvim",
		-- load the plugin at startup
		event = "VeryLazy",
		-- Because of the keys part, you will be lazy loading this plugin.
		-- The plugin will only load once one of the keys is used.
		-- If you want to load the plugin at startup, add something like event = "VeryLazy",
		-- or lazy = false. One of both options will work.
		opts = {
			-- your configuration comes here
			-- for example
			enabled = true,  -- if you want to enable the plugin
			message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
			date_format = "%H:%M on %m/%d/%y", -- template for the date, check Date format section for more options
			virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options

		},
	}
}
