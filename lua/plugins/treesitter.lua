return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "VeryLazy" },
	lazy = vim.fn.argc(-1) == 0,
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

	config = function()
		require('nvim-treesitter.configs').setup {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
				ensure_installed = { "c", "cpp", "lua", "rust" },
			}
		}
	end
}
