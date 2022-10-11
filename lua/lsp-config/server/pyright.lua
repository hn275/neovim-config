local opts = require("lsp-config.default")
require("lspconfig")["pyright"].setup({
	on_attach = opts.on_attach,
	flags = opts.lsp_flags,
})
