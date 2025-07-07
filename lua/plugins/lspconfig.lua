return {
	'neovim/nvim-lspconfig',
	event = {"VeryLazy"},

	config = function()
		require('lspconfig').clangd.setup({})
		require('lspconfig').rust_analyzer.setup({})
	end
}
