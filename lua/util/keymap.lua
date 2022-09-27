local M = {}

M.keymap = function(mode, lsh, rhs, opts)
	if not opts then
		opts = { noremap = true, silent = true }
	end
	vim.keymap.set(mode, lsh, rhs, opts)
end

return M
