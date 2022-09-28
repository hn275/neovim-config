local status, Input = pcall(require, "nui.input")

if not status then
	print("Nui failed, revert to regular command line")
	return
end

local input_config = {
	relative = "cursor",
	position = {
		col = 0,
		row = -3,
	},
	size = {
		width = 20,
		height = 10,
	},
	border = {
		style = "single",
		text = {
			top = "Rename variable",
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
			vim.lsp.buf.rename(val)
		end,
	})
	-- overload escape to close input
	input:map("n", "<ESC>", function()
		input:unmount()
	end, { noremap = true, silent = true })
	input:mount()
end
