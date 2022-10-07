local opts = require("lsp-config.default")

-- enable builtin snippet support
local capabilities = opts.capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig")["jsonnet_ls"].setup({
	opts.default_settings(),
	on_attach = opts.on_attach,
	flags = opts.lsp_flags,
	capabilities = capabilities,
})
