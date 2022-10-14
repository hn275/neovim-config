local nightfox_status, nightfox = pcall(require, "nightfox")

if not nightfox_status then
	return
end

nightfox.setup({
	options = {
		styles = {
			comments = "italic",
			keyword = "bold",
			type = "italic,bold",
		},
	},
})

vim.cmd.colorscheme("carbonfox")
