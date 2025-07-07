-- Set up leader keys so that lazy won't be confused
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Mapping F1 to file manager open and close
vim.api.nvim_set_keymap('n', '<F1>', ':NvimTreeToggle<ENTER>', { noremap = true, silent = true, desc="Toggle filetree" })

 -- Mapping F2 to toggling automatic session saving (provided by vim-obsession)
vim.api.nvim_set_keymap('n', '<F2>', ':Obsession<ENTER>', { noremap = true, silent = true, desc="Start session tracking" })

 -- Mapping F3 to error fixing when fix available
vim.api.nvim_set_keymap('n', '<F3>', ':lua vim.lsp.buf.code_action()<ENTER>', { noremap = true, silent = true, desc="Code actions" })

-- LSP go to keymaps
vim.api.nvim_set_keymap( 'n', 'gd', ':lua vim.lsp.buf.definition() <ENTER>', { noremap = true, silent = true, desc="Go to definition" } )
vim.api.nvim_set_keymap( 'n', 'gD', ':lua vim.lsp.buf.declaration() <ENTER>', { noremap = true, silent = true, desc="Go to declaration" } )
vim.api.nvim_set_keymap( 'n', 'gi', ':lua vim.lsp.buf.implementation() <ENTER>', { noremap = true, silent = true, desc="Go to implementation" } )
vim.api.nvim_set_keymap( 'n', 'g<C-D>', ':sp <ENTER>:lua vim.lsp.buf.definition() <ENTER>', { noremap = true, silent = true, desc="Open definition" } )

-- Telescope shortcuts
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, desc="Find files" } );
vim.keymap.set('n', '<leader>fs', ':Telescope live_grep<CR>', { noremap = true, desc="Find snippet" } );
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, desc="Find buffers" } );
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, desc="Find help" } );

-- Mapping build and run keys
--
-- F5 - build&run
-- leader (space) + F5 = build
-- F6 - run
-- leader + F6 = run current file (useful for files that start with #!)
--
if vim.fn.has('unix') == 1 then
	vim.api.nvim_set_keymap('n', '<F5>', ':!./build.sh && ./run.sh<CR>', { noremap = true, silent = true, desc="Build and run" })
	vim.api.nvim_set_keymap('n', '<Leader><F5>', ':!./build.sh<CR>', { noremap = true, silent = true, desc="Build" })
	vim.api.nvim_set_keymap('n', '<F6>', ':!./run.sh<CR>', { noremap = true, silent = true, desc="Run" })
	vim.api.nvim_set_keymap('n', '<Leader><F6>', ':!./%<CR>', { noremap = true, silent = true, desc="Run current" })

elseif vim.fn.has('win32') == 1 then
	vim.api.nvim_set_keymap('n', '<F5>', ':! .\\build.bat<CR> && .\\run.bat<CR>', { noremap = true, silent = true, desc="Build and run"})
	vim.api.nvim_set_keymap('n', '<leader><F5>', ':! .\\build.bat', { noremap = true, silent = true, desc="Build" })
	vim.api.nvim_set_keymap('n', '<F6>', ':!.\\run.bat & exit<CR>', { noremap = true, silent = true, desc="Run" })
	vim.api.nvim_set_keymap('n', '<leader><F6>', ':!.\\%<CR>', { noremap = true, silent = true, desc="Run current" })
end

-- Math markup
vim.api.nvim_set_keymap('n', '<Leader>mp', ':lua require("nabla").popup()<CR>', { noremap=true, silent=true, desc="Preview math" } )
vim.api.nvim_set_keymap('n', '<Leader>ml', ':lua require("nabla").toggle_virt()<CR>', { noremap=true, silent=true, desc="Toggle unicode math" } )

-- which-key
	vim.api.nvim_set_keymap( 'n', '<leader>?', ':lua require("which-key").show({ global = false })<CR>', { noremap = true, silent=true, desc="Show buffer commands" } );
