return {
	'neovim/nvim-lspconfig',
	event = { "BufReadPost", "BufNewFile", "VeryLazy"},

	config = function()
		require('lspconfig').clangd.setup({})
		require('lspconfig').rust_analyzer.setup({})
		require('lspconfig').zls.setup({})
		vim.g.zig_fmt_autosave = 0 -- Get rid of the insanely aggressive autoformatting
	end
}
