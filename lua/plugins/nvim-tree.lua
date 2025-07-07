return { 
	'kyazdani42/nvim-tree.lua',

	config = function() 
		require('nvim-tree').setup({
			view = {
				adaptive_size = true,
			}
		})
	end,

	lazy = true,
	dependencies = {
		'kyazdani42/nvim-web-devicons'
	},

	cmd = { "NvimTreeToggle" }
}
