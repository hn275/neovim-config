local ok, cmd = pcall(require, "cmd-palette")

if not ok then
	error("no cmd-palette")
end

local fn = require("cmdpalette.cmd")

cmd.setup({
	{ label = "exec", callback = fn.common.exec },
	{ label = "buffers", cmd = "FzfLua buffers" },
	{ label = "clipboard", cmd = "FzfLua registers" },
	{ label = "marks", cmd = "FzfLua marks" },
	{ label = "todo", cmd = "TodoTelescope" },
	{ label = "LSP code action", callback = fn.lsp.code_action },
	{ label = "LSP diagnositics", cmd = "FzfLua diagnostics_document" },
	{ label = "LSP finder", cmd = "Lspsaga lsp_finder" },
	{ label = "LSP format", callback = fn.lsp.format },
	{ label = "LSP implement", cmd = "Lspsaga implement" },
	{ label = "LSP symbols", cmd = "FzfLua lsp_document_symbols" },
	{ label = "GIT lazygit", callback = fn.git.lazygit },
	{ label = "GIT branches", cmd = "FzfLua git_branches" },
	{ label = "SESSION save", cmd = "SessionSave" },
	{ label = "SESSION load", cmd = "SessionLoad" },
})

local k = require("util.keymap").keymap
k("n", "<leader>c", "<CMD>CmdPalette<CR>")
