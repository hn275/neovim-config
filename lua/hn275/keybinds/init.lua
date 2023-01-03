-- Key map function
local k = require("hn275.util.keymap").keymap

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

-- Buffers --
k("n", "si", "<CMD>split<CR>")
k("n", "ss", "<CMD>vsplit<CR>")
-- relocate
k("n", "<C-h>", "<C-w><S-h>")
k("n", "<C-j>", "<C-w><S-j>")
k("n", "<C-k>", "<C-w><S-k>")
k("n", "<C-l>", "<C-w><S-l>")
-- navigate
k("n", "sh", "<C-w>h")
k("n", "sj", "<C-w>j")
k("n", "sk", "<C-w>k")
k("n", "sl", "<C-w>l")

-- quit
k("n", "qq", "<CMD>q!<CR>")

-- Visual Mode --
-- stay in visual mode while indenting
k("v", "<", "<gv")
k("v", ">", ">gv")

-- Terminal --
-- Spawn a terminal

-- k("n", "<C-t>", "<CMD>ToggleTerm direction=horizontal<CR>")
k("t", "<Esc>", "<C-\\><C-N>") -- to normal mode in term
