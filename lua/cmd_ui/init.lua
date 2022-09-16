local status, Input = pcall(require, "nui.input")

if not status then
	print("Nui failed, revert to regular command line")
	return
end

local input_config = {
	relative = "win",
	position = {
		row = "50%",
		col = "50%",
	},
	size = {
		width = "50%",
		height = 10,
	},
	border = {
		style = "rounded",
		text = {
			top = "What do g?",
			top_align = "left",
		},
	},
	win_options = {
		winhighlight = "Normal:Normal,FloatBorder:Normal",
	},
}

local M = {}
M.cmd = function()
	local is_input_active = false -- pop up active variable

	-- Initializing input popup
	local input = Input(input_config, {
		prompt = ":",
		default_value = "",
		-- on submit function send user input to command line
		on_submit = function(val)
			-- protected call, in case it is not a valid command
			local cmd_valid, _ = pcall(vim.cmd, val)
			if not cmd_valid then
				print("Invalid command")
			end
		end,
		-- on close function just sets the popup var to be false
		on_close = function()
			is_input_active = false -- set popup var to be false
		end,
		-- on change function just set the popup var to be true
		on_change = function()
			if is_input_active then
				-- if popup var is already true then do nothing
				return
			end
			is_input_active = true
		end,
	})

	-- overload escape to close input
	input:map("n", "<ESC>", function()
		input:unmount()
	end, { noremap = true, silent = true })

	-- only mount input if popup var is false
	if not is_input_active then
		input:mount()
	end
end

return M
