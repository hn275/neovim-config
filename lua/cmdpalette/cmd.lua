local M = {}

M.common = {
	exec = require("toggleterm.util").exec,
}

M.lsp = {
	format = vim.lsp.buf.format,
	code_action = vim.lsp.buf.code_action,
}

-- Git
M.git = {
	lazygit = require("toggleterm.util").git,
}

return M
