-- Set up leader keys so that lazy won't be confused
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Mapping F1 to file manager open and close
vim.api.nvim_set_keymap('n', '<F1>', ':NvimTreeToggle<ENTER>', { noremap = true, silent = true })

 -- Mapping F2 to toggling automatic session saving (provided by vim-obsession)
vim.api.nvim_set_keymap('n', '<F2>', ':Obsession<ENTER>', { noremap = true, silent = true })

 -- Mapping F3 to error fixing when fix available
vim.api.nvim_set_keymap('n', '<F3>', ':lua vim.lsp.buf.code_action()<ENTER>', { noremap = true, silent = true })

-- LSP go to keymaps
vim.api.nvim_set_keymap( 'n', 'gd', ':lua vim.lsp.buf.definition() <ENTER>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap( 'n', 'gD', ':lua vim.lsp.buf.declaration() <ENTER>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap( 'n', 'gi', ':lua vim.lsp.buf.implementation() <ENTER>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap( 'n', 'g<C-D>', ':sp <ENTER>:lua vim.lsp.buf.definition() <ENTER>', { noremap = true, silent = true } )


-- Mapping build and run keys
--
-- F5 - build&run
-- leader (space) + F5 = build
-- F6 - run
-- leader + F6 = run current file (useful for files that start with #!)
--
if vim.fn.has('unix') == 1 then
	vim.api.nvim_set_keymap('n', '<F5>', ':!./build.sh && ./run.sh<CR>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader><F5>', ':!./build.sh<CR>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<F6>', ':!./run.sh<CR>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader><F6>', ':!./%<CR>', { noremap = true, silent = true })

elseif vim.fn.has('win32') == 1 then
	-- vim.api.nvim_set_keymap('n', '<F5>', ':new | r ! .\\compile.bat :setlocal buftype=nofile :setlocal bufhidden=hide :setlocal noswapfile<CR>', { noremap = true, silent = true })	
	vim.api.nvim_set_keymap('n', '<F5>', ':! .\\build.bat<CR> && .\\run.bat<CR>', { noremap = true, silent = true })	
	vim.api.nvim_set_keymap('n', '<leader><F5>', ':! .\\build.bat', { noremap = true, silent = true })	
	vim.api.nvim_set_keymap('n', '<F6>', ':!.\\run.bat & exit<CR>', { noremap = true, silent = true })	
	vim.api.nvim_set_keymap('n', '<leader><F6>', ':!.\\%<CR>', { noremap = true, silent = true })
end


vim.api.nvim_command('nnoremap <Leader>p :lua require("nabla").popup()<CR>')
vim.api.nvim_command('nnoremap <Leader>l :lua require("nabla").toggle_virt()<CR>')
