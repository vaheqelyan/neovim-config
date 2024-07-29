local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local opt = vim.opt -- for conciseness
local g = vim.g

vim.o.updatetime = 250

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.scrolloff = 999

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = false -- highlight the current cursor line
opt.cursorlineopt = "number"

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
--opt.termguicolors = true
--opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = false

-- Disable status line
opt.showmode = false
opt.ruler = false
opt.laststatus = 0

-- Disable providers we do not give a shit about
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
-- g.loaded_node_provider = 0

-- Disable some in built plugins completely
g.loaded_netrwPlugin = 1
g.loaded_matchparen = 1
g.loaded_matchit = 1
g.loaded_2html_plugin = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logipat = 1
g.loaded_rrhelper = 1
g.loaded_spellfile_plugin = 1
g.loaded_tarPlugin = 1
g.loaded_vimballPlugin = 1
g.loaded_zipPlugin = 1
opt.shortmess = opt.shortmess + "c"
opt.pumblend = 0

autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = augroup("highlightyank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})
