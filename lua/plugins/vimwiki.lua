return { 
	'vimwiki/vimwiki',
	lazy=true,
	event='BufEnter *.vimwiki',
	keys = { "<Leader>ww" },

	config = function()
		vim.api.nvim_command([[
			let g:vimwiki_list = [{'path': '~/sync/vimwiki/', 'syntax': 'default', 'ext': '.vimwiki'}]
		]])
	end
}
