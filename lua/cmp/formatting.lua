local kind_icons = {
	Class = "",
	Color = "",
	Constant = "",
	Constructor = "",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "",
	File = "",
	Folder = "",
	Function = "",
	Interface = "",
	Keyword = "",
	Method = "m",
	Module = "",
	Operator = "",
	Property = "",
	Reference = "",
	Snippet = "",
	Struct = "",
	Text = "",
	TypeParameter = "",
	Unit = "",
	Value = "",
	Variable = "",
}

local M = {
	fields = { "kind", "abbr", "menu" },
	format = function(entry, vim_item)
		-- icons
		vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
		-- autocompletion source
		vim_item.menu = ({
			luasnip = "SNIP",
			nvim_lsp = "LSP",
			buffer = "BUF",
			path = "PATH",
		})[entry.source.name]

		vim_item.kind = " " .. vim_item.kind .. " "
		vim_item.menu = "<" .. vim_item.menu .. ">"

		return vim_item
	end,
}

return M
