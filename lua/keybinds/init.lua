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

k("n", "<leader>bd", ":bd<CR>", opts) -- close buffers
k("n", "<leader>vs", ":vsplit<CR>", opts) -- vertical split

-- BufferLine go to buffer
k("n", "<a-1>", ":lua require('bufferline').go_to_buffer(1, true)<CR>", opts)
k("n", "<a-2>", ":lua require('bufferline').go_to_buffer(2, true)<CR>", opts)
k("n", "<a-3>", ":lua require('bufferline').go_to_buffer(3, true)<CR>", opts)
k("n", "<a-4>", ":lua require('bufferline').go_to_buffer(4, true)<CR>", opts)
k("n", "<a-5>", ":lua require('bufferline').go_to_buffer(5, true)<CR>", opts)
k("n", "<a-6>", ":lua require('bufferline').go_to_buffer(6, true)<CR>", opts)
k("n", "<a-7>", ":lua require('bufferline').go_to_buffer(7, true)<CR>", opts)
k("n", "<a-8>", ":lua require('bufferline').go_to_buffer(8, true)<CR>", opts)
k("n", "<a-9>", ":lua require('bufferline').go_to_buffer(9, true)<CR>", opts)

-- TodoComment
-- The options are TodoQuickFix, TodoLocList, and TodoTelescope
k("n", "<leader>ft", ":TodoTelescope<CR>", opts) -- mapping for TodoTelescope
-- Telescope
k("n", "<leader>ff", ":Telescope find_files<CR>", opts)
k("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- Nvim treesitter
k("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- Navigating Tabs
k("n", "<a-l>", ":bn<CR>", opts)
k("n", "<a-h>", ":bp<CR>", opts)

-- Visual Mode --
-- stay in indent mode
k("v", "<", "<gv", opts)
k("v", ">", ">gv", opts)

-- lsp related stuff
---@diagnostic disable-next-line: unused-local
local lspsaga_status, lspsaga = pcall(require, "lspsaga")
if lspsaga_status then
	local action = require("lspsaga.action")
	local diagnostics = require("lspsaga.diagnostic")
	-- lsp finder
	k("n", "<leader>FF", "<cmd>Lspsaga lsp_finder<CR>", opts)

	-- lsp code action
	k("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	k("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)

	-- hover doc
	k("n", "K", ":Lspsaga hover_doc<CR>", opts)
	k("n", "<C-j>", function()
		action.smart_scroll_with_saga(1)
	end, opts)
	k("n", "<C-k", function()
		action.smart_scroll_with_saga(-1)
	end, opts)

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
