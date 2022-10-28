local ok, cmd = pcall(require, "cmd-palette")

if not ok then
	error("no cmd-palette")
end

local fn = require("cmdpalette.cmd")

cmd.setup({
	{ label = "format", callback = fn.common.format },
	{ label = "exec", callback = fn.common.exec },
	{ label = "diagnositics", cmd = "Telescope diagnositics" },
	{ label = "buffers", cmd = "Telescope buffers" },
	{ label = "clipboard", cmd = "Telescope registers" },
	{ label = "marks", cmd = "Telescope marks" },
	{ label = "todo", cmd = "TodoTelescope" },
	{ label = "------Git------", cmd = "CmdPalette" },
	{ label = "\tlazygit", callback = fn.git.lazygit },
	{ label = "\tissues", cmd = "Telescope gh issues" },
	{ label = "\tpull requests", cmd = "Telescope gh pull_request" },
})

local k = require("util.keymap").keymap
k("n", "<leader>c", "<CMD>CmdPalette<CR>")
