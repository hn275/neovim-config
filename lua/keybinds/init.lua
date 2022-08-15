---@diagnostic disable: unused-local
-- Key map function
local k = vim.keymap.set

-- Key map options
local opts = { noremap = true, silent = true }

-- Unbinding key
k("n", "gt", "<NOP>", opts)
k("n", "gT", "<NOP>", opts)

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

-- Buffers
k("n", "<leader>|", "<CMD>vsplit<CR>", opts) -- vertical split
k("n", "<leader>-", "<CMD>split<CR>", opts) -- horizontal split
k("n", "<A-w>", "<CMD>bd<CR>", opts) -- close buffer
k("n", "<A-]>", "<CMD>bn<CR>", opts) -- next buffer
k("n", "<A-[>", "<CMD>bp<CR>", opts) -- prev buffer

-- Tabs
k("n", "<A-}>", "<CMD>tabnext<CR>", opts) -- next tab
k("n", "<A-{>", "<CMD>tabprevious<CR>", opts) -- next tab
k("n", "<A-t>", "<CMD>tabnew<CR>", opts) -- tab new

-- TodoComment
-- The options are TodoQuickFix, TodoLocList, and TodoTelescope
k("n", "<leader>ft", "<CMD>TodoTelescope<CR>", opts) -- mapping for TodoTelescope
-- Telescope
k("n", "<leader>ff", "<CMD>Telescope find_files<CR>", opts)
k("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", opts)

-- Nvim treesitter
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
	k("n", "<leader>d", "<CMD>Lspsaga preview_definition<CR>", opts)

	-- outline
	k("n", "<leader>s", "<CMD>LSoutlineToggle<CR>", opts)
else
	print("!failed to load LspSaga key binding")
end

-- Indent Blankline --
local indentblankline_status, indentblankline = pcall(require, "indent_blankline")
if indentblankline_status then
	k("n", "<A-i>", "<CMD>IndentBlanklineToggle<CR>")
else
	print("!failed to load key map for indent blankline")
end

-- Tabline Keybind --
local tabline_status, tabline = pcall(require, "tabline")
if tabline_status then
	k("n", "<A-b>", '<CMD>TablineBuffersBind bufname("%")<CR>', opts)
	k("n", "<A-r>", ":TablineTabRename ", { noremap = true }) -- tab rename
else
	print("!failed to load key map for Tabline Buffer")
end
