return {

	{ 'ful1e5/onedark.nvim', priority=1000, config = { require('onedark').setup() } },
	{ 'xiyaowong/nvim-transparent',
		config = function()
			require("transparent").setup({
				groups = { -- table: default groups
					'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
					'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
					'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
					'SignColumn', 'CursorLineNr', 'EndOfBuffer',
				  },
				extra_groups = {
					"NvimTreeNormal",
					"NvimTreeNormalNC",
					"NvimTreeStatusLine",
					"NvimTreeStatusLineNC",
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"CursorLineNr"
				},
				exclude_groups = {},
			})
		end,
	}
}
