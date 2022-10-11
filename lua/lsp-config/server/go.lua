local opts = require("lsp-config.default")
require("lspconfig")["gopls"].setup({
	on_attach = opts.on_attach,
	flags = opts.lsp_flags,
})
