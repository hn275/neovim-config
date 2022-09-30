local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local M = {}

M.doc = s({
	trig = "doc",
	name = "Doc string",
}, {
	t({ "/**", "" }),
	t(" * "),
	i(1),
	t({ "", " */" }),
	i(0),
})

M.params = s({
	trig = "params",
	name = "Doc string params",
}, {
	t("@params {"),
	i(1),
	t("} "),
	i(2, "[paramName]"),
	t(": "),
	i(0, "[description]"),
})

return M
