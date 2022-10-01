-- Key map function
local k = require("util.keymap").keymap

-- Unbinding key
k("n", "<C-t>", "<NOP>")
k("n", "qq", "<NOP>")
k("n", "ZQ", "<NOP>")

-- Do not yank when deleteing with x
k("n", "x", '"_x')

-- Remapping leader key
k("", "<Space>", "<NOP>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tabs --
k("n", "tt", "<CMD>tabe<CR>")
k("n", "tr", "<CMD>tabclose<CR>")

-- quit
k("n", "qq", "<CMD>q!<CR>")

-- Navigating between windows
k("n", "<C-h>", "<C-w>h")
k("n", "<C-j>", "<C-w>j")
k("n", "<C-k>", "<C-w>k")
k("n", "<C-l>", "<C-w>l")

-- Fuzzy finder
k("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
k("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
k("n", "<leader>fb", "<CMD>Telescope buffers<CR>")

-- NvimTree
k("n", "<leader>t", "<CMD>NvimTreeToggle<CR>")

-- Visual Mode --
-- stay in indent mode
k("v", "<", "<gv")
k("v", ">", ">gv")

-- Visual text
local virtualtext_lsp = require("lsp-config.utils.virtualtext")
virtualtext_lsp.init()
k("n", "<leader>v", virtualtext_lsp.toggle, { noremap = true })
