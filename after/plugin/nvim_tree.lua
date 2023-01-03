local tree_ok, tree = pcall(require, "nvim-tree")

if not tree_ok then
	vim.cmd.PackerSync()
	print("Restart nvim to apply changes.")
	return
end

vim.g.loaded_netwr = 1
vim.g.loaded_netwrPlugin = 1
vim.opt.termguicolors = true

tree.setup({
	auto_reload_on_write = true,
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "<C-v>", action = "" }, -- unmap vsplit
				{ key = "<C-s>", action = "vsplit" },
				{ key = "<C-x>", action = "" }, -- unmap hsplit
				{ key = "<C-i>", action = "split" },
				{ key = "-", action = "" }, -- unmap dir up
				{ key = "u", action = "dir_up" },
				{ key = "s", action = "" }, -- unmap search node
				{ key = "<CR>", action = "" }, -- unmap Return key
			},
		},
		float = {
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "cursor",
				border = "single",
			},
		},
	},
	filters = {
		dotfiles = true,
	},
})

local k = require("hn275.util.keymap").keymap
k("n", "<leader>t", "<CMD>NvimTreeToggle<CR>")
