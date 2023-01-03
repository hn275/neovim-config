local k = require("hn275.util.keymap").keymap

-- server setting
require("hn275.lsp.server")
require("hn275.lsp.null-ls.null-ls")
require("hn275.lsp.saga")

local virtualtext_lsp = require("hn275.lsp.utils.virtualtext")
virtualtext_lsp.init()
k("n", "<leader>v", virtualtext_lsp.toggle, { noremap = true })
