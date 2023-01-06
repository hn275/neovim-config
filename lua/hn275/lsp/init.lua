require("hn275.lsp.server")

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	group = vim.api.nvim_create_augroup("LspInit", { clear = true }),
	callback = function()
		local current_dir = vim.api.nvim_exec("pwd", true)
		vim.lsp.buf.add_workspace_folder(current_dir)
	end,
})
