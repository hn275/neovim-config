local opts = {
	nord_contrast = true,
	nord_borders = true,
	nord_cursorline_transparent = false,
	nord_enable_sidebar_background = true,
	nord_disable_background = false,
	nord_italic = true,
	nord_uniform_diff_background = true, -- colorful background when used in diff
}

for key, val in pairs(opts) do
	vim.api.nvim_set_var(key, val)
end

require("nord").set()