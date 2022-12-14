local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")

if not treesitter_status then
	vim.cmd.PackerSync()
	print("Restart nvim to apply changes.")
	return
end

-- Syntax highlighting configs
local highlight_parsers = { -- enabled languages parsers
	"javascript",
	"typescript",
	"tsx",
	"json",
	"html",
	"bash",
	"cpp",
	"css",
	"lua",
	"markdown",
	"python",
	"rasi",
	"scss",
	"regex",
	"vim",
	"norg",
	"r",
	"go",
}

-- Autotag configs
local autotag_filetypes = { -- enabled file types
	"html",
	"javascript",
	"javascriptreact",
	"jsx",
	"typescript",
	"typescriptreact",
	"tsx",
	"xml",
	"markdown",
}

-- context-commentstring configuration
local context_commentstring_config = require("hn275.plugin-config.tree-sitter.ts-context-commentstring")

treesitter.setup({
	ensure_installed = highlight_parsers, -- install all parsers name
	highlight = {
		enable = true, -- enabling highlight
	},
	indent = {
		enable = true, -- enable auto indentation
	},
	autotag = {
		enable = true, -- enabling tag completion
		filetypes = autotag_filetypes, -- auto enable on these filetypes
	},
	context_commentstring = {
		enable = true, -- enable ts_context_commentstring
		config = context_commentstring_config, -- config
	},
})
