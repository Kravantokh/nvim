return {
	{
		"MattiasMTS/cmp-dbee",
		lazy=true,
		cmd = {"Dbee"},
		dependencies = {
			"kndndrj/nvim-dbee"
		},
		ft = "sql",
		opts = {}
	},
	{
		"kndndrj/nvim-dbee",
		lazy=true,
		cmd = {"Dbee"},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		build = function()
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup()
		end
	}
}
