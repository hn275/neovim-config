local opts = require("lsp_config.default_opts")
require('lspconfig')['jsonls'].setup{
    on_attach = opts.on_attach,
    flags = opts.lsp_flags,
    capabilities = opts.capabilities(),
}
