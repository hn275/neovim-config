local luasnip_ok, ls = pcall(require, "luasnip")
if not luasnip_ok then
	return
end

local js_snips = require("snips.javascript")
local ts_snips = require("snips.typescript")
local cpp_snips = require("snips.cpp")
local norg_snips = require("snips.norg")
local go_snips = require("snips.go")
local tex_snips = require("snips.tex")

local map_snippets_ft = {
	{
		filetype = "javascript",
		snippets = js_snips,
	},
	{
		filetype = "cpp",
		snippets = cpp_snips,
	},
	{
		filetype = "norg",
		snippets = norg_snips,
	},
	{
		filetype = "go",
		snippets = go_snips,
	},
	{
		filetype = "tex",
		snippets = tex_snips,
	},
	{
		filetype = "typescript",
		snippets = ts_snips,
	},
}

for _, v in ipairs(map_snippets_ft) do
	ls.add_snippets(v.filetype, v.snippets)
end
