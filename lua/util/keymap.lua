local M = {}

M.keymap = function(mode, lsh, rhs, opts)
	local options
	if not opts then
		options = { noremap = true, silent = true }
	else
		options = opts
	end
	vim.keymap.set(mode, lsh, rhs, options)
end

return M
