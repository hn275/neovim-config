local k = require("util.keymap").keymap

-- server setting
require("lsp-config.server")
require("lsp-config.null-ls.null-ls")

local virtualtext_lsp = require("lsp-config.utils.virtualtext")
virtualtext_lsp.init()
k("n", "<leader>v", virtualtext_lsp.toggle, { noremap = true })
