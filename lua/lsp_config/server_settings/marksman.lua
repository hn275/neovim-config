local opts = require("lsp_config.default_opts")
require("lspconfig")["marksman"].setup({
	opts.default_settings(),
	on_attach = opts.on_attach,
	flags = opts.lsp_flags,
})
