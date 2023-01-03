local luasnip_ok, ls = pcall(require, "luasnip")
if not luasnip_ok then
	return
end

local js_snips = require("hn275.plugin-config.snips.javascript")
local ts_snips = require("hn275.plugin-config.snips.typescript")
local cpp_snips = require("hn275.plugin-config.snips.typescript")
local norg_snips = require("hn275.plugin-config.snips.cpp.docstring")
local go_snips = require("hn275.plugin-config.snips.cpp.docstring")
local lua_snips = require("hn275.plugin-config.snips.javascript.utils.docstring")
local tex_snips = require("hn275.plugin-config.snips.tex")

local map_snippets_ft = {
	{
		filetype = "javascriptreact",
		snippets = js_snips,
	},
	{
		filetype = "javascript",
		snippets = js_snips,
	},
	{
		filetype = "typescriptreact",
		snippets = ts_snips,
	},
	{
		filetype = "typescript",
		snippets = ts_snips,
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
		filetype = "lua",
		snippets = lua_snips,
	},
}

for _, v in ipairs(map_snippets_ft) do
	ls.add_snippets(v.filetype, v.snippets)
end
