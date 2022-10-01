local luasnip_ok, luasnip = pcall(require, "luasnip")
if not luasnip_ok then
	return
end

local js_snips = require("snips.javascript")
local cpp_snips = require("snips.cpp")

local map_snippets_ft = {
	{
		filetype = "javascript",
		snippets = js_snips,
	},
	{
		filetype = "cpp",
		snippets = cpp_snips,
	},
}

for _, v in ipairs(map_snippets_ft) do
	luasnip.add_snippets(v.filetype, v.snippets)
end
