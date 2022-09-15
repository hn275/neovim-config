local M

local popup_status, popup = pcall(require, "nui.input")

M.popup = function()
	if not popup_status then
		print("nui failed")
		return
	end

	local event = require("nui.utils.autocmd").event

	local popup_options = {
		relative = "cursor",
		position = {
			row = 1,
			col = 0,
		},
		size = 20,
		border = {
			style = "rounded",
			text = {
				top = "[Input]",
				top_align = "left",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal",
		},
	}

	local input = popup(popup_options, {
		prompt = "Quit NeoVim now? (Y/n)",
		default_value = "Y",
		on_submit = function(value)
			return value
		end,
	})
end

return M
