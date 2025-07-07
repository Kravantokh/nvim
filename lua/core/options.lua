-- Show line numbering vim.api.nvim_command('set number relativenumber')
-- Highligt horizontal and vertical position of the cursor

vim.o.cursorline = true
vim.o.cursorcolumn = true

-- Indent wrapped lines to the same level as the original line
vim.o.breakindent = true

-- Make tabs be displayed as 5 spaces but stored and deleted as normal tabs 
vim.o.tabstop = 5
--  Make tabs behave as they should without neovim adding mixed tabs an spaces and such nonsense. Why even is that crap on by default?!
vim.o.shiftwidth = 5
vim.o.softtabstop = -1

-- Some idiots just love fucking up my tab indentation in all sorts of syntax files. I'll make sure they can't do that
-- Yeah, this is terribly inefficient, it resets these settings on every buffer switch, but what else can I do if others just love fucking tabs up?
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter" }, {
	pattern = {"*.*"},
	callback = function(ev)
		vim.g.editorconfig = false
		vim.o.autoindent = true
		vim.o.cindent = false
		vim.o.expandtab = false
		vim.o.tabstop = 5
		vim.o.shiftwidth = 5
		vim.o.softtabstop = -1
	end
})

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

-- For some reason zig files are messed up with spaces, so let's fix that
