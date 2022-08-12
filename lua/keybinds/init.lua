-- Key map function
local k = vim.keymap.set

-- Key map options
local opts = { noremap = true, silent = true }

-- Remapping leader key
k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Mode --
-- Navigating between windows
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

k("n", "<C-w>", ":bd<CR>", opts) -- close buffers
k("n", "<C-|>", ":vsplit<CR>", opts) -- vertical split

-- TodoComment
-- The options are TodoQuickFix, TodoLocList, and TodoTelescope
k("n", "<leader>ft", ":TodoTelescope<CR>", opts) -- mapping for TodoTelescope
-- Telescope
k("n", "<leader>ff", ":Telescope find_files<CR>", opts)
k("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- Nvim treesitter
k("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Visual Mode --
-- stay in indent mode
k("v", "<", "<gv", opts)
k("v", ">", ">gv", opts)

-- lsp related stuff
---@diagnostic disable-next-line: unused-local
local lspsaga_status, lspsaga = pcall(require, "lspsaga")
if lspsaga_status then
	local diagnostics = require("lspsaga.diagnostic")
	-- lsp finder
	k("n", "<leader>FF", "<cmd>Lspsaga lsp_finder<CR>", opts)

	-- lsp code action
	k("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	k("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)

	-- hover doc
	k("n", "K", ":Lspsaga hover_doc<CR>", opts)

	-- signature help
	k("n", "<leader>S", "<Cmd>Lspsaga signature_help<CR>", opts)

	-- rename
	k("n", "<leader>rn", "<Cmd>Lspsaga rename<CR>", opts)

	-- diagnostics
	k("n", "<leader>e", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostic
	k("n", "<leader>e", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostic
	k("n", "ge", function() -- jump to the next diagnostic
		diagnostics.goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, opts)
	k("n", "gE", function() -- jumo to the previous diagnostic
		diagnostics.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, opts)

	-- definition
	k("n", "<leader>d", "<Cmd>Lspsaga preview_definition<CR>", opts)

	-- outline
	k("n", "<leader>s", "<Cmd>LSoutlineToggle<CR>", opts)
else
	print("!failed to load LspSaga key binding")
end

-- Indent Blankline --
---@diagnostic disable-next-line: unused-local
local indentblankline_status, indentblankline = pcall(require, "indent_blankline")
if indentblankline_status then
	k("n", "<A-i>", "<CMD>IndentBlanklineToggle<CR>")
else
	print("!failed to load key map for indent blankline")
end
