local tree_ok, tree = pcall(require, "nvim-tree")

if not tree_ok then
	error("FAILED: nvim-tree")
	return
end

tree.setup({
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
	},
})

require("util.keymap").keymap("n", "<leader>t", "<CMD>NvimTreeToggle<CR>")
