local opts = require("hn275.lsp.default")
require("lspconfig")["tsserver"].setup({
	on_attach = opts.on_attach,
	flags = opts.lsp_flags,
})
