local opts = require("hn275.lsp.default")

-- enable builtin snippet support
local capabilities = opts.capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig")["bashls"].setup({
	on_attach = opts.on_attach,
	flags = opts.lsp_flags,
	capabilities = capabilities,
})
