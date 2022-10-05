local status, Input = pcall(require, "nui.input")

if not status then
	return
end

local input_config = {
	relative = "win",
	position = {
		col = "50%",
		row = 2,
	},
	size = {
		width = 40,
		height = 10,
	},
	border = {
		style = "single",
		text = {
			top = "new tab name",
			top_align = "center",
		},
	},
	win_options = {
		winhighlight = "Normal:Conditional,FloatBorder:Conditional",
	},
}

return function()
	-- Initializing input popup
	local input = Input(input_config, {
		on_submit = function(val)
			vim.cmd("LualineRenameTab " .. val)
		end,
	})
	-- overload escape to close input
	input:map("n", "<ESC>", function()
		input:unmount()
	end, { noremap = true, silent = true })
	input:mount()
end
