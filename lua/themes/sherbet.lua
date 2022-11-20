local opt = {
	sherbet_italic_keywords = false,
	sherbet_italic_functions = false,
	sherbet_italic_loops = false,
	sherbet_italic_conditionals = false,
}

for k, v in pairs(opt) do
	vim.g[k] = v
end

vim.g.sherbet_italic_comments = true

vim.cmd.colorscheme("sherbet")
