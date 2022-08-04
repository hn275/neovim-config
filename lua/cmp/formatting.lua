local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local M = {
	fields = { "kind", "abbr", "menu" },
	format = function(entry, vim_item)
		-- icons
		vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
		-- autocompletion source
		vim_item.menu = ({
			nvim_lsp = "[LSP]",
			buffer = "[BUF]",
			path = "[PATH]",
			ultisnips = "[SNIPS]",
		})[entry.source.name]
		return vim_item
	end,
}

return M
