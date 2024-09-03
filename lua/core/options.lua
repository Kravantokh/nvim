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
vim.o.softtabstop = 1

-- Show matches when seacrhing
vim.o.showmatch = true
vim.o.hlsearch = false

-- Show partial commands in the lower right corner 
vim.o.showcmd = true
vim.o.number = true

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

-- Enable code folding based on lsp
vim.opt.foldmethod='syntax'
vim.opt.foldexpr='nvim_treesitter#foldexpr()'
