local status, neorg = pcall(require, "neorg")

if not status then
	return
end

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					school = "~/Schools",
				},
			},
		},
		-- ['core.norg.concealer'] = {},
	},
})
