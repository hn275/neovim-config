-- local lualine_ok, lualine = pcall(require, "lualine")
local tabline_ok, tabline = pcall(require, "tabline")

if not tabline_ok then
	print("failed to load tabline")
else
	tabline.setup({
		show_index = true,
		modified_icon = "[+]",
		close_icon = "",
		show_icon = false,
		separator = "|",
		padding = 1,
	})
end

-- if not lualine_ok then
-- 	print("failed: lualine")
-- else
-- 	lualine.setup({
-- 		options = {
-- 			icons_enabled = true,
-- 			theme = "auto",
-- 			component_separators = { left = "|", right = "" },
-- 			section_separators = { left = "", right = "" },
-- 			disabled_filetypes = {
-- 				statusline = {},
-- 				winbar = {},
-- 			},
-- 			globalstatus = true,
-- 		},
-- 		sections = {
-- 			lualine_a = { "mode" },
-- 			lualine_b = { "branch", "diff", "diagnostics" },
-- 			lualine_c = { "filename" },
-- 			lualine_x = {},
-- 			lualine_y = {},
-- 			lualine_z = { "location" },
-- 		},
-- 		tabline = {
-- 			lualine_a = {
-- 				{
-- 					"tabs",
-- 					mode = 2,
-- 					max_length = vim.o.columns,
-- 				},
-- 			},
-- 			lualine_z = { "filename" },
-- 		},
-- 	})
-- end

-- statusline
--[[ 
vim.opt.statusline =
	"[%{toupper(mode())}] %< %{gitbranch#name()} | %f %m %r %w %= %l:%c %{&fileencoding?&fileencoding:&encoding}"

-- minimal statusline on start
_G.laststatus = 2
vim.opt.laststatus = _G.laststatus

-- toggle statusline
vim.keymap.set("n", "<space>z", function()
	if _G.laststatus == 0 then
		_G.laststatus = 2
	else
		_G.laststatus = 0
	end
	vim.opt.laststatus = _G.laststatus
end, { noremap = true, silent = true })
--]]

require("simpleline").setup()