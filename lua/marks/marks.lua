local reach_status, reach = pcall(require, "reach")
local mark_status, marks = pcall(require, "marks")

if not (reach_status or mark_status) then
	return
end

marks.setup({
	default_mappings = true,
	builtin_marks = { ".", "<", ">", "^" },
	cyclic = true,
	force_write_shada = false,
	refresh_interval = 250,
	sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
	excluded_filetypes = {},
	bookmark_0 = {
		sign = "⚑",
		virt_text = "hello world",
		annotate = false,
	},
	mappings = {},
})

local options = {
	handle = "auto", -- 'bufnr' or 'dynamic' or 'auto'
	show_icons = true,
	show_current = false, -- Include current buffer in the list
	show_modified = true, -- Show buffer modified indicator
	modified_icon = "⬤", -- Character to use as modified indicator
	grayout_current = true, -- Wheter to gray out current buffer entry
	force_delete = {}, -- List of filetypes / buftypes to use
	filter = nil, -- Function taking bufnr as parameter,
	sort = nil, -- Comparator function (bufnr, bufnr) -> bool
	terminal_char = "\\", -- Character to use for terminal buffer handles
	grayout = true, -- Gray out non matching entries
	auto_handles = require("reach.buffers.constant").auto_handles,
	auto_exclude_handles = {}, -- A list of characters not to use as handles when
	previous = {
		enable = true, -- Mark last used buffers with specified chars and colors
		depth = 2, -- Maximum number of buffers to mark
		chars = { "•" }, -- Characters to use as markers,
		groups = { -- Highlight groups for markers,
			"String", -- last one is used when depth > #groups
			"Comment",
		},
	},
}

reach.setup({})
