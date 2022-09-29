local options = {
	backup = false, -- creates backup
	clipboard = "unnamedplus", -- allow accessing the clipboard for neovim
	cmdheight = 1, -- adding height to the command line
	conceallevel = 0, -- making `` visible in markdown files
	fileencoding = "utf-8",
	hlsearch = false, -- highlight all matched search
	ignorecase = true, -- ignore case in search pattern
	pumheight = 10, -- pop up menu height
	showmode = false, -- mode is displayed in the status line already
	-- showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	autoindent = true, -- automatically apply indentation from the last line to the next line
	smartindent = true, -- enabling smart indent
	-- splitbelow = true, -- new vsplit is forced to opened up below
	-- splitright = true, -- new hsplit is forced to opened up to the right
	swapfile = false, -- prevent creating swap files
	termguicolors = true, -- set term gui colors
	timeoutlen = 1000, -- time to wait for a mapped sequence to reset
	undofile = true, -- persistent undo
	updatetime = 500, -- faster completion (4000ms by default)
	writebackup = false, -- if a file is being edited by another program, or was written by another program, wont be allowed to write
	expandtab = true, -- expanding tab to spaces
	shiftwidth = 4, -- number of spaces indented
	tabstop = 4, -- number of spaces tab key inserts
	cursorline = true, -- highlighting current cursor lines
	cursorcolumn = false, -- highlight current cursor column
	number = true, -- line number
	relativenumber = true, -- enable relative number
	numberwidth = 3, -- set number column width
	signcolumn = "yes:1", -- show sign column when there is a sign
	wrap = false, -- no wrapping,
	foldmethod = "manual", -- setting fold method
	foldcolumn = "1", -- dedicated column for fold symbols
	foldlevelstart = 999, -- always open all folds when entering a file
	guifont = "JetBrainsMono Nerd Font:h11",
	-- guicursor = "a:blinkon250",
	mouse = "",
	-- cmdheight = 0,
}

vim.opt.shortmess:append("c")

for key, val in pairs(options) do
	vim.opt[key] = val
end

vim.cmd([[set iskeyword+=-]]) -- turn key-word into 1 word for `dw` instead of 2 (by default neovim reads words-like-this 3 words)

-- for tsx - jsx files
vim.cmd([[ autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */} ]])

-- for scss files
vim.cmd([[ autocmd FileType scss setlocal commentstring="/* \ %s\ */" ]])

vim.api.nvim_create_autocmd({ "BufWrite" }, {
	-- pattern = filetypes,
	callback = function()
		vim.lsp.buf.format()
	end,
})

vim.cmd([[

if exists("g:neovide")
	let g:neovide_transparency = 0.95 "Transparency
	let g:neovide_confirm_quit = v:true "Confirm before quitting so I don't accidentally close it with :wq
	let g:neovide_remember_window_size = v:true "So it does not randomly resize it
	let g:neovide_hide_mouse_when_typing = v:true
endif
]])

vim.cmd([[
" Save fold
set viewoptions-=options
augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
    autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
augroup END

" 2 space tabs
if &filetype == "javascript" || &filetype == "typescript"
	setlocal shiftwidth=2
	setlocal tabstop=2
endif

]])
