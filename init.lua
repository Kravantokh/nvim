-- Show line numbering
vim.api.nvim_command('set number relativenumber')
-- Highligt horizontal and vertical position of the cursor
vim.api.nvim_command('set cursorline')
vim.api.nvim_command('set cursorcolumn')

-- Make tabs be displayed as 4 space but stored and deleted as normal tabs 
vim.api.nvim_command('set tabstop=5')
vim.api.nvim_command('set shiftwidth=5')
vim.api.nvim_command('set softtabstop')

-- Show matches when seacrhing
vim.api.nvim_command('set showmatch')
vim.api.nvim_command('set nohlsearch')
-- Show partial commands in the lower right corner 
vim.api.nvim_command('set showcmd')
vim.api.nvim_command('set number')
vim.api.nvim_command('set number')

-- Enable treesitter based folding
vim.api.nvim_command('set foldmethod=expr')
vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')

-- Unfold everything by default
vim.api.nvim_command('set foldlevelstart=20')



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
require('nvim-treesitter.configs').setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
		ensure_installed = { "c", "cpp", "lua", "rust" },
	}
}

 -- Mapping F1 to file manager open and close
vim.api.nvim_set_keymap('n', '<F1>', ':NvimTreeToggle<ENTER>', { noremap = true, silent = true })

 -- Mapping F2 to toggling automatic session saving (provided by vim-obsession)
vim.api.nvim_set_keymap('n', '<F2>', ':Obsession<ENTER>', { noremap = true, silent = true })

-- Mapping F5 to run the compile script in the opened folder according to the platform
if vim.fn.has('unix') == 1 then
	vim.api.nvim_set_keymap('n', '<F5>', ':!./compile.sh<ENTER>', { noremap = true, silent = true })

elseif vim.fn.has('win32') == 1 then
	vim.api.nvim_set_keymap('n', '<F5>', ':! .\\compile.bat & exit<CR>', { noremap = true, silent = true })	
end

-- Mapping F6 to run the run script in the opened folder
if vim.fn.has('unix') == 1 then
	vim.api.nvim_set_keymap('n', '<F6>', ':!./run.sh<ENTER>', { noremap = true, silent = true })

elseif vim.fn.has('win32') == 1 then
	vim.api.nvim_set_keymap('n', '<F6>', ':! .\\run.bat & exit<CR>', { noremap = true, silent = true })	
end
