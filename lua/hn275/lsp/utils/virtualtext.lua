local M = {}
local vt_ok, _ = pcall(vim.api.nvim_get_var, "vt") -- vt stands for virtual_text

M.init = function()
	if not vt_ok then
		vim.api.nvim_set_var("vt", false) -- enable by default
	end
	vim.diagnostic.config({ virtual_text = false })
end

M.toggle = function()
	local current_vt = vim.api.nvim_get_var("vt")
	vim.api.nvim_set_var("vt", not current_vt)
	vim.diagnostic.config({ virtual_text = not current_vt })
	print("Virtual text", not current_vt)
end

return M
