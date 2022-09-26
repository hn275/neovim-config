local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
	return
end

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		prompt_prefix = " ",
		path_display = { "truncate" },
	},
})
