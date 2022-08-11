local indentblankline_status, indentblankline = pcall(require, "indent_blankline")
if not indentblankline_status then
	return
end

indentblankline.setup()

-- Disbaling indentblank line by default
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd([[IndentBlanklineDisable]])
	end,
})
