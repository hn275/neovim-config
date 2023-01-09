local telescope_ok, t = pcall(require, "telescope.builtin")

local lsp = vim.lsp.buf
local diag = vim.diagnostic

local register = function(defaultFn, fallbackFn)
	if telescope_ok then
		return defaultFn
	else
		return fallbackFn
	end
end

return {
	{
		mode = "n",
		key = "K",
		fn = lsp.hover,
	},
	{
		mode = "n",
		key = "gs",
		fn = lsp.signature_help,
	},
	{
		mode = "n",
		key = "gd",
		fn = "<CMD>sp<CR><C-w>T<CMD>lua vim.lsp.buf.definition()<CR>",
	},
	{
		mode = "n",
		key = "gf",
		fn = register(t.lsp_references, lsp.references),
	},
	{
		mode = "n",
		key = "ge",
		fn = diag.open_float,
	},
	{
		mode = "n",
		key = "gn",
		fn = diag.goto_next,
	},
	{
		mode = "n",
		key = "gp",
		fn = diag.goto_prev,
	},
	{
		mode = "n",
		key = "<leader>rn",
		fn = lsp.rename,
	},
}
