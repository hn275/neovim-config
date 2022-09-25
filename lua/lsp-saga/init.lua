local status, lspsaga = pcall(require, "lspsaga")

if not status then
	print("!lspsaga failed")
	return
end

lspsaga.init_lsp_saga({
	border_style = "rounded", -- single | double | rounded | bold | plus
	move_in_saga = {
		next = "<C-j>",
		prev = "<C-k>",
	},
	finder_action_keys = {
		quit = "<Escape>",
	},
	code_action_keys = {
		quit = "<Escape>",
		exec = "<Cr>",
	},
	code_action_lightbulb = {
		enable = false,
	},
	rename_action_quit = "<Escape>",
})

local k = require("util.keymap").keymap
local diagnostics = require("lspsaga.diagnostic")
k("n", "<leader>FF", "<CMD>Lspsaga lsp_finder<CR>")
k("n", "<leader>ca", "<CMD>Lspsaga code_action<CR>")
k("v", "<leader>ca", "<CMD><C-U>Lspsaga range_code_action<CR>")
k("n", "K", ":Lspsaga hover_doc<CR>")
k("n", "<leader>S", "<CMD>Lspsaga signature_help<CR>")
k("n", "<leader>rn", "<CMD>Lspsaga rename<CR>")
k("n", "<leader>e", "<CMD>Lspsaga show_line_diagnostics<CR>") -- show diagnostic
k("n", "<leader>e", "<CMD>Lspsaga show_cursor_diagnostics<CR>") -- show diagnostic
k("n", "ge", function() -- jump to the next diagnostic
	diagnostics.goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
k("n", "gE", function() -- jumo to the previous diagnostic
	diagnostics.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
k("n", "gd", "<CMD>Lspsaga preview_definition<CR>")
k("n", "<leader>s", "<CMD>LSoutlineToggle<CR>")
