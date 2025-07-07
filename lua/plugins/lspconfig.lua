return {
	'neovim/nvim-lspconfig',
	event = { "BufReadPost", "BufNewFile", "VeryLazy"},

	config = function()
		require('lspconfig').clangd.setup({})
		require('lspconfig').rust_analyzer.setup({})
	end
}
