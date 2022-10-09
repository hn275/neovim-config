-- Key map function
local k = require("util.keymap").keymap

-- Unbinding key
local normal_keys = {
	"<C-t>",
	"qq",
	"ZQ",
	"s",
	"S",
}
for _, key in pairs(normal_keys) do
	k("n", key, "<NOP>")
end

-- Do not yank when deleting with x
k("n", "x", '"_x')

-- Remapping leader key
k("", "<Space>", "<NOP>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tabs --
k("n", "tt", "<CMD>tabe<CR>")
k("n", "tr", "<CMD>tabclose<CR>")

-- Splits --
k("n", "si", "<CMD>split<CR>")
k("n", "ss", "<CMD>vsplit<CR>")
k("n", "sh", "<C-w><S-h>")
k("n", "sj", "<C-w><S-j>")
k("n", "sk", "<C-w><S-k>")
k("n", "sl", "<C-w><S-l>")

-- quit
k("n", "qq", "<CMD>q!<CR>")

-- Navigating between windows
k("n", "<C-h>", "<C-w>h")
k("n", "<C-j>", "<C-w>j")
k("n", "<C-k>", "<C-w>k")
k("n", "<C-l>", "<C-w>l")

-- NvimTree
k("n", "<leader>t", "<CMD>NvimTreeToggle<CR>")

-- Visual Mode --
-- stay in visual mode while indenting
k("v", "<", "<gv")
k("v", ">", ">gv")

-- Terminal mode
k("n", "<C-t>", function()
	vim.cmd([[vsplit | terminal]])
	vim.o.number = false
	vim.o.relativenumber = false
end)
k("t", "<Esc>", "<C-\\><C-N>") -- to normal mode in term
