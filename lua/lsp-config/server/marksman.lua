--[[
-- This server handles Markdown, LaTeX, and Neorg
--]]
local opts = require("lsp-config.default")
require("lspconfig")["ltex"].setup({
	opts.default_settings(),
	on_attach = opts.on_attach,
	flags = opts.lsp_flags,
})

vim.api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{
		pattern = { "*.norg" },
		callback = function()
			vim.cmd("set filetype=norg")
		end
	}
)
