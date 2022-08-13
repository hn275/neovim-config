local status, tabline = pcall(require, "tabline")

-- if not status then
-- 	print("!tabline failed to load")
-- 	return
-- end

tabline.setup({
	enable = true,
	options = {
		-- If lualine is installed tabline will use separators configured in lualine by default.
		-- These options can be used to override those settings.
		section_separators = { "", "" },
		component_separators = { "", "" },
		max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
		show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
		show_devicons = true, -- this shows devicons in buffer section
		show_bufnr = false, -- this appends [bufnr] to buffer section,
		show_filename_only = false, -- shows base filename only instead of relative path in filename
		modified_icon = "[+]", -- change the default modified icon
		modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
		show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
	},
})

local file_patterns = {
	"*.*",
}
-- auto bind on buf enter
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = file_patterns,
	callback = function()
		vim.cmd([[TablineBuffersBind bufname("%")]])
	end,
})
-- ask for a tab name when a new tab is created
vim.api.nvim_create_autocmd({ "TabNew" }, {
	callback = function()
		local file_name = vim.api.nvim_eval([[input("Tab name: ")]])
		if file_name == nil or file_name == "" then
			return
		end
		vim.cmd("TablineTabRename " .. file_name)
	end,
})
