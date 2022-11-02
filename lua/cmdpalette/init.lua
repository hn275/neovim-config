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
	return string.rep("-", remaining_len / 2) .. title:upper() .. string.rep("-", remaining_len / 2)
end

cmd.setup({
	{ label = title("common"), cmd = "CmdPalette" },
	{ label = "exec", callback = fn.common.exec },
	{ label = "buffers", cmd = "Telescope buffers" },
	{ label = "clipboard", cmd = "Telescope registers" },
	{ label = "marks", cmd = "Telescope marks" },
	{ label = "todo", cmd = "TodoTelescope" },
	{ label = title("lsp"), cmd = "CmdPalette" },
	{ label = "format", callback = fn.lsp.format },
	{ label = "code action", callback = fn.lsp.code_action },
	{ label = "diagnositics", cmd = "Telescope diagnositics" },
	{ label = "finder", cmd = "Lspsaga lsp_finder" },
	{ label = "implement", cmd = "Lspsaga implement" },
	{ label = title("git"), cmd = "CmdPalette" },
	{ label = "lazygit", callback = fn.git.lazygit },
	{ label = "issues", cmd = "Telescope gh issues" },
	{ label = "pull requests", cmd = "Telescope gh pull_request" },
})

local k = require("util.keymap").keymap
k("n", "<leader>c", "<CMD>CmdPalette<CR>")
