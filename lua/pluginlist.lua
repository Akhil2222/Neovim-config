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
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
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
				},
			})
		end
	},
	{
    	'nvim-telescope/telescope.nvim', tag = '0.1.5',
      	dependencies = { 'nvim-lua/plenary.nvim' }
    },
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "cpp", "python", "java", "c_sharp"},
				sync_install = false,
				highlight = {
					enable = true
				},
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil
				}
			})
		end,
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
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			require("rainbow-delimiters.setup").setup({
				highlight = {
					'RainbowDelimiterYellow',
					'RainbowDelimiterOrange',
					'RainbowDelimiterViolet',
					'RainbowDelimiterCyan',
				}
			})
		end,
	},
	{
	  "folke/tokyonight.nvim",
	  opts = {},
	},
}
