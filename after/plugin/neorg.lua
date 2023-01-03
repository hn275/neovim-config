local neorg_ok, neorg = pcall(require, "neorg")

if not neorg_ok then
	vim.cmd.PackerSync()
	print("Restart nvim to apply changes")
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},

		["core.norg.qol.toc"] = {
			config = {
				close_split_on_jump = false,
				toc_split_placement = "left",
				default_toc_mode = "split",
			},
		},

		["core.norg.dirman"] = {
			config = {
				workspaces = {
					school = "~/Schools",
				},
			},
		},

		["core.norg.concealer"] = {
			config = {
				dim_code_blocks = {
					-- width = "content",
					conceal = true,
				},
			},
		},

		["core.norg.completion"] = {
			config = {
				engine = "nvim-cmp",
			},
		},
	},
})
