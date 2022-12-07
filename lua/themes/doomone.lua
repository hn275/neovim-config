local theme_ok, _ = pcall(require, "doom-one")

if not theme_ok then
	return
end

local opt = {
	doom_one_cursor_coloring = true,
	doom_one_terminal_colors = true,
	doom_one_italic_comments = true,
	doom_one_enable_treesitter = true,
	doom_one_diagnostics_text_color = false,
	doom_one_transparent_background = false,
	doom_one_pumblend_enable = false,
	doom_one_pumblend_transparency = 20,
	doom_one_plugin_neorg = true,
	doom_one_plugin_barbar = false,
	doom_one_plugin_telescope = false,
	doom_one_plugin_neogit = true,
	doom_one_plugin_nvim_tree = true,
	doom_one_plugin_dashboard = true,
	doom_one_plugin_startify = true,
	doom_one_plugin_whichkey = true,
	doom_one_plugin_indent_blankline = true,
	doom_one_plugin_vim_illuminate = true,
	doom_one_plugin_lspsaga = false,
}

for k, v in pairs(opt) do
	vim.g[k] = v
end

vim.cmd.colorscheme("doom-one")
