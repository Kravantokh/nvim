-- Show line numbering vim.api.nvim_command('set number relativenumber')
-- Highligt horizontal and vertical position of the cursor


vim.o.cursorline = true
vim.o.cursorcolumn = true

-- Indent wrapped lines to the same level as the original line
vim.o.breakindent = true

-- Make tabs be displayed as 5 spaces but stored and deleted as normal tabs 
vim.o.tabstop = 5
--  Make tabs behave as they should without neovim adding mixed tabs an spaces and such nonsense. Why even is that crap on by default?!
vim.o.shiftwidth = 0
vim.o.softtabstop = true

-- Show matches when seacrhing
vim.o.showmatch = true
vim.o.hlsearch = false

-- Show partial commands in the lower right corner 
vim.o.showcmd = true
vim.o.number = true

-- Enable treesitter based folding
--vim.api.nvim_command('set foldmethod=expr')
--vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

-- Unfold everything by default
vim.o.foldlevelstart = 20
vim.o.relativenumber = true
vim.o.number = true

-- Enable sane clipboard usage
vim.o.clipboard = 'unnamedplus'

-- Enable virtual edit to be able to move the cursor wherever I want (great for ASCII drawings)
vim.o.virtualedit = 'block,insert'
vim.o.list = true

-- Make tabs visible
vim.o.listchars = 'tab:¦ '


local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function()

	-- Let packer manage itself
	use 'wbthomason/packer.nvim'

	-- onedark theme
	-- use('navarasu/onedark.nvim')
	use('ful1e5/onedark.nvim')	

	-- file manager
	use {
		'kyazdani42/nvim-tree.lua',
  	requires = {
		  'kyazdani42/nvim-web-devicons', -- optional, for file icons
	    }
	}

	-- treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	
	-- session manager
	use('tpope/vim-obsession')

	-- Autocomplete backend
	use 'neovim/nvim-lspconfig'
	
	-- Autocomplete menu
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	
	-- Transparency plugin
	use 'xiyaowong/nvim-transparent'
	-- Inline latex
	use 'jbyuki/nabla.nvim'

	-- Vimwiki
	use 'vimwiki/vimwiki'

	-- Prerequisite for sedna
	use 'inkarkat/vim-SyntaxRange'

	use 'jbyuki/instant.nvim'

	-- Development
	use "~/sync/prog/nvim_plugin_dev/sedna.nvim/"
	use "~/sync/prog/nvim_plugin_dev/"

	if packer_bootstrap then
		require('packer').sync()
	end
end)


 -- theme setup
-- require('onedark').load()
require('onedark').setup()


 -- file manager setup

 require('nvim-tree').setup{
	view = {
		adaptive_size = true,
	}
}
vim.api.nvim_command('set splitright')

-- custom icon setup
require('nvim-web-devicons').setup {
	default = true;
}
 -- tresitter config
-- require('nvim-treesitter.configs').setup {
-- 	highlight = {
-- 		enable = true,
-- 		additional_vim_regex_highlighting = false,
-- 		ensure_installed = { "c", "cpp", "lua", "rust" },
-- 	}
-- }

-- Language server setup
require'lspconfig'.clangd.setup{}
require 'lspconfig'.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

-- Autocomplete config
local luasnip = require 'luasnip'
-- nvim-cmp
local cmp = require 'cmp'

cmp.setup {
	snippet = {
		expand = function(args)
		require('luasnip').lsp_expand(args.body)
	end,
	},
	mapping = {
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		['<S-Tab>'] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}

-- Transparency config
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


-- vimwiki setup
vim.api.nvim_command([[
    set nocompatible
    filetype plugin on
    syntax on
    let g:vimwiki_list = [{'path': '~/sync/vimwiki/', 'syntax': 'default', 'ext': '.vimwiki'}]
]])

-- instant username setting for group editing
vim.api.nvim_command( 'let g:instant_username="kravantokh"' )

-- Mapping F1 to file manager open and close
vim.api.nvim_set_keymap('n', '<F1>', ':NvimTreeToggle<ENTER>', { noremap = true, silent = true })

 -- Mapping F2 to toggling automatic session saving (provided by vim-obsession)
vim.api.nvim_set_keymap('n', '<F2>', ':Obsession<ENTER>', { noremap = true, silent = true })

 -- Mapping F3 to error fixing when fix available
vim.api.nvim_set_keymap('n', '<F3>', ':lua vim.lsp.buf.code_action()<ENTER>', { noremap = true, silent = true })


-- Mapping F5 to run the compile script in the opened folder according to the platform
if vim.fn.has('unix') == 1 then
	vim.api.nvim_set_keymap('n', '<F5>', ':!./compile.sh<ENTER>', { noremap = true, silent = true })

elseif vim.fn.has('win32') == 1 then
	-- vim.api.nvim_set_keymap('n', '<F5>', ':new | r ! .\\compile.bat :setlocal buftype=nofile :setlocal bufhidden=hide :setlocal noswapfile<CR>', { noremap = true, silent = true })	
	vim.api.nvim_set_keymap('n', '<F5>', ':! .\\compile.bat<CR>', { noremap = true, silent = true })	
end

-- Mapping F6 to run the run script in the opened folder
if vim.fn.has('unix') == 1 then
	vim.api.nvim_set_keymap('n', '<F6>', ':!./run.sh<ENTER>', { noremap = true, silent = true })

elseif vim.fn.has('win32') == 1 then
	vim.api.nvim_set_keymap('n', '<F6>', ':!.\\run.bat & exit<CR>', { noremap = true, silent = true })	

end

vim.api.nvim_command('nnoremap <Leader>p :lua require("nabla").popup()<CR>')
vim.api.nvim_command('nnoremap <Leader>l :lua require("nabla").toggle_virt()<CR>')


