local ok, cmd = pcall(require, "cmd-palette")

if not ok then
	error("no cmd-palette")
end

local fn = require("cmdpalette.cmd")

local title = function(title)
	local max_len = vim.o.columns * 0.89
	local remaining_len = max_len - string.len(title)
	if remaining_len % 2 == 1 then
		remaining_len = remaining_len + 1
	end
	return string.rep("_", remaining_len / 2) .. title:upper() .. string.rep("_", remaining_len / 2)
end

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
})

local k = require("util.keymap").keymap
k("n", "<leader>c", "<CMD>CmdPalette<CR>")
