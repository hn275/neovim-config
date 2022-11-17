vim.o.backup = false -- creates backup
vim.o.clipboard = "unnamedplus" -- allow accessing the clipboard for neovim
vim.o.cmdheight = 1 -- adding height to the command line
vim.o.conceallevel = 0 -- making `` visible in markdown files
vim.o.fileencoding = "utf-8"
vim.o.hlsearch = false -- highlight all matched search
vim.o.ignorecase = true -- ignore case in search pattern
vim.o.pumheight = 10 -- pop up menu height
vim.o.showmode = false -- mode is displayed in the status line already
vim.o.smartcase = true -- smart case
vim.o.autoindent = true -- automatically apply indentation from the last line to the next line
vim.o.smartindent = false -- enabling smart indent
vim.o.splitbelow = true -- new vsplit is forced to opened up below
vim.o.splitright = true -- new hsplit is forced to opened up to the right
vim.o.swapfile = false -- prevent creating swap files
vim.o.termguicolors = true -- set term gui colors
vim.o.timeoutlen = 1000 -- time to wait for a mapped sequence to reset
vim.o.undofile = true -- persistent undo
vim.o.updatetime = 500 -- faster completion (4000ms by default)
vim.o.writebackup = false -- if a file is being edited by another program or was written by another program wont be allowed to write
vim.o.expandtab = true -- expanding tab to spaces
vim.o.shiftwidth = 4 -- number of spaces indented
vim.o.tabstop = 4 -- number of spaces tab key inserts
vim.o.cursorline = true -- highlighting current cursor lines
vim.o.cursorcolumn = false -- highlight current cursor column
vim.o.number = true -- line number
vim.o.wrap = false -- no wrap
vim.o.relativenumber = true -- enable relative number
vim.o.numberwidth = 2 -- set number column width
vim.o.signcolumn = "yes:1" -- show sign column when there is a sign
vim.o.foldmethod = "manual" -- setting fold method
vim.o.foldcolumn = "1" -- dedicated column for fold symbols
vim.o.foldlevelstart = 999 -- always open all folds when entering a file
vim.o.mouse = ""
vim.o.winbar = "%#StatuslineAccent#%=%m%f" -- win bar display file name an modifier flag
vim.o.laststatus = 3 -- global status
vim.o.showtabline = 1 -- always show tabs
vim.o.compatible = false

-- Font size for Mac
require("env-setting.mac")

-- Neovide config
require("env-setting.neovide")

vim.opt.shortmess:append("c")

vim.cmd([[set iskeyword+=-]]) -- turn key-word into 1 word for `dw` instead of 2 (by default neovim reads words-like-this 3 words)

vim.api.nvim_create_autocmd({ "BufWrite" }, {
	pattern = { "*.*" },
	callback = function()
		vim.lsp.buf.format()
	end,
})

-- 2 space tabs
local ft = {
	"*.js",
	"*.jsx",
	"*.ts",
	"*.tsx",
	"*.css",
	"*.scss",
	"*.html",
	"*.svg",
}

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = ft,
	callback = function()
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
	end,
})

vim.cmd([[
" Save fold
set viewoptions-=options
augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* if &ft !=# 'help' | mkview | endif
    autocmd BufWinEnter *.* if &ft !=# 'help' | silent! loadview | endif
augroup END

" run time path
set rtp+=./start

]])
