local opts = require("lsp-config.default")

-- enable builtin snippet support
local capabilities = opts.capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig")["jsonnet_ls"].setup({
	on_attach = opts.on_attach,
	flags = opts.lsp_flags,
	capabilities = capabilities,
})
