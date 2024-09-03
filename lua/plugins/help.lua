return {
	"folke/which-key.nvim",
	event = { "VeryLazy" },

	config = function()
		local wk = require("which-key")
		wk.setup({preset = "helix"})
		wk.add({
			{ "<leader>f", name="Find" },
			{ "<leader>g", name="Git" },
			{ "<leader>m", name="Markup" }
		})
	end
}
