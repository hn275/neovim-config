local null_ls_status, null_ls = pcall(require, "null-ls")

if not null_ls_status then
	print("!failed null-ls")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeAction = null_ls.builtins.code_actions
null_ls.setup({
	debounce = 500,
	diagnostics_format = "[#{c}] #{m} (#{s})",
	sources = {
		-- Code actions
		codeAction.eslint_d, -- js, jsx, ts, tsx
		-- Diagnostics
		-- diagnostics.eslint_d, -- js, jsx, ts, tsx
		-- diagnostics.markdownlint, -- markdown
		-- diagnostics.stylint, -- css, scss, sass, less
		-- diagnostics.tsc, -- tsc compiler linter
		-- diagnostics.golangci_lint, -- go
		-- diagnostics.cpplint, -- cpp
		-- Formatting
		formatting.black, -- python
		formatting.markdownlint, -- markdown
		formatting.prettierd, -- js, jsx, ts, tsx, html, yaml
		formatting.stylua, -- lua
		formatting.clang_format, -- lua
	},
})
