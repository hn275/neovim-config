local opts = require("lsp_config.default_opts")

-- enable builtin snippet support
local capabilities = opts.capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig')['cssls'].setup{
    on_attach = opts.on_attach,
    flags = opts.lsp_flags,
    capabilities = capabilities,
}

