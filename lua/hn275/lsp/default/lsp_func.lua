local lsp = vim.lsp.buf
local diag = vim.diagnostic
local lspsaga = function(arg)
	return "<CMD>Lspsaga " .. arg .. "<CR>"
end

return {
	{
		mode = "n",
		key = "K",
		fn = lspsaga("hover_doc"),
	},
	{
		mode = "n",
		key = "gs",
		fn = lsp.signature_help,
	},
	{
		mode = "n",
		key = "ga",
		fn = lspsaga("code_action"),
	},
	{
		mode = "n",
		key = "gd",
		fn = lspsaga("peek_definition"),
	},
	{
		mode = "n",
		key = "gf",
		fn = lspsaga("lsp_finder"),
	},
	{
		mode = "n",
		key = "ge",
		fn = diag.open_float,
	},
	{
		mode = "n",
		key = "gn",
		fn = lspsaga("diagnostic_jump_next"),
	},
	{
		mode = "n",
		key = "gp",
		fn = lspsaga("diagnostic_jump_prev"),
	},
	{
		mode = "n",
		key = "<leader>rn",
		fn = lsp.rename,
	},
}
