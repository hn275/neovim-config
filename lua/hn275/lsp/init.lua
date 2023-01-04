local k = require("hn275.util.keymap").keymap

-- server setting
require("hn275.lsp.server")
k("n", "<leader>v", "<CMD>Lspsaga toggle_virtual_text<CR>", { noremap = true })
