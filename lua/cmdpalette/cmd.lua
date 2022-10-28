local M = {}

M.common = {
	format = vim.lsp.buf.format,
	exec = require("toggleterm.util").exec,
}

-- Git
M.git = {
	lazygit = require("toggleterm.util").git,
}

return M
