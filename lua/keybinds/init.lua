---@diagnostic disable: unused-local
-- Key map function
local k = vim.keymap.set

-- Key map options
local opts = { noremap = true, silent = true }

-- Unbinding key
k("n", "<C-t>", "<NOP>", opts)
-- k("n", ":", "<NOP>", opts)

-- Do not yank when deleteing with x
k("n", "x", '"_x', opts)
-- Remapping leader key
k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Tabs --
k("n", "tt", "<CMD>tabe<CR>", opts)
k("n", "tr", "<CMD>tabclose<CR>", opts)

-- Navigating between windows
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

-- Harpoon --
local harpoon_status, harpoon = pcall(require, "harpoon")
if harpoon_status then
	local harpoon_functions = require("harpoon.harpoon")
	k("n", "<leader>hm", harpoon_functions.add, { noremap = true })
	k("n", "<leader>ht", harpoon_functions.toggle, opts)
end

-- TodoComment
-- The options are TodoQuickFix, TodoLocList, and TodoTelescope
k("n", "<leader>ft", "<CMD>TodoTelescope<CR>", opts) -- mapping for TodoTelescope

-- Telescope
k("n", "<leader>ff", "<CMD>Telescope find_files<CR>", opts)
k("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", opts)

-- NvimTree
k("n", "<leader>t", "<CMD>NvimTreeToggle<CR>", opts)

-- Visual Mode --
-- stay in indent mode
k("v", "<", "<gv", opts)
k("v", ">", ">gv", opts)

-- lsp related stuff
local lspsaga_status, lspsaga = pcall(require, "lspsaga")
if lspsaga_status then
	local diagnostics = require("lspsaga.diagnostic")
	-- lsp finder
	k("n", "<leader>FF", "<CMD>Lspsaga lsp_finder<CR>", opts)

	-- lsp code action
	k("n", "<leader>ca", "<CMD>Lspsaga code_action<CR>", opts)
	k("v", "<leader>ca", "<CMD><C-U>Lspsaga range_code_action<CR>", opts)

	-- hover doc
	k("n", "K", ":Lspsaga hover_doc<CR>", opts)

	-- signature help
	k("n", "<leader>S", "<CMD>Lspsaga signature_help<CR>", opts)

	-- rename
	k("n", "<leader>rn", "<CMD>Lspsaga rename<CR>", opts)

	-- diagnostics
	k("n", "<leader>e", "<CMD>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostic
	k("n", "<leader>e", "<CMD>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostic
	k("n", "ge", function() -- jump to the next diagnostic
		diagnostics.goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, opts)
	k("n", "gE", function() -- jumo to the previous diagnostic
		diagnostics.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, opts)

	-- definition
	k("n", "gd", "<CMD>Lspsaga preview_definition<CR>", opts)

	-- outline
	k("n", "<leader>s", "<CMD>LSoutlineToggle<CR>", opts)
else
	print("!failed to load LspSaga key binding")
end

-- CMD GUI --
-- local cmd_gui_status, cmd_gui = pcall(require, "cmd_ui")
-- if cmd_gui_status then
-- 	vim.keymap.set("n", "<leader>:", ":", { noremap = true })
-- 	vim.keymap.set("n", ":", "<NOP>", opts)
-- 	vim.keymap.set("n", ":", cmd_gui.cmd, opts)
-- else
-- 	print("cmd_ui failed")
-- end
