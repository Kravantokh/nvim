return {
	'tpope/vim-obsession',
	-- Lazy-load unless the plugin has to load a session because of the -S argument
	lazy = (function()
		for i = 0,table.getn(vim.v.argv) do
			if vim.v.argv[i] == "-S" then
				return false
			end
		end
		return true
	end)(),

	cmd = { 'Obsession' }
}
