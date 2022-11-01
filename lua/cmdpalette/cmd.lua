local M = {}

M.common = {
	exec = require("toggleterm.util").exec,
}

M.lsp = {
	format = vim.lsp.buf.format,
	code_actions = vim.lsp.buf.code_actions,
}

-- Git
M.git = {
	lazygit = require("toggleterm.util").git,
}

return M
