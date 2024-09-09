return {
	{ 'hrsh7th/nvim-cmp',
		event = {"VeryLazy"},
		dependencies = { 'L3MON4D3/LuaSnip' },
		config = function()
			local cmp = require('cmp')
			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					['<Tab>'] = cmp.mapping.select_next_item(),
					['<S-Tab>'] = cmp.mapping.select_prev_item(),
					['<C-j>'] = cmp.mapping.select_next_item(),
					['<C-k>'] = cmp.mapping.select_prev_item()

				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'cmp-dbee' }
				}, {
					{ name = 'buffer' },
				})
			})
		end
	},

	{ 'hrsh7th/cmp-nvim-lsp',
		event = {"VeryLazy"}
	},

	{ 'saadparwaiz1/cmp_luasnip',
		event = {"VeryLazy"}
	},

	{ 'L3MON4D3/LuaSnip',
		event = {"VeryLazy"}
	}
}
