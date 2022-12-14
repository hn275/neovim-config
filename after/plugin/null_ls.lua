local null_ls_status, null_ls = pcall(require, "null-ls")

if not null_ls_status then
	print("!failed null-ls")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeAction = null_ls.builtins.code_actions
local hover = null_ls.builtins.hover

null_ls.setup({
	debounce = 500,
	diagnostics_format = "[#{c}] #{m} (#{s})",
	sources = {
		codeAction.eslint_d, -- js, jsx, ts, tsx
		formatting.black, -- python
		formatting.markdownlint, -- markdown
		formatting.prettierd, -- js, jsx, ts, tsx, html, yaml
		formatting.stylua, -- lua

		hover.dictionary,

		diagnostics.staticcheck,
	},
})
