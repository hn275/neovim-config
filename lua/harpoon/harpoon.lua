local harpoon_status, harpoon = pcall(require, "harpoon")
if not harpoon_status then
	return
end

harpoon.setup({
	menu = {
		width = vim.api.nvim_win_get_width(0) - 20,
	},
	save_on_toggle = true,
})
