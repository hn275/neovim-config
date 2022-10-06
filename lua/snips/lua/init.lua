local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node
local s = ls.snippet

return {
	s({
		trig = "@params",
		name = "doc string params",
	}, {
		t("-- @params {"),
		i(1, "[type]"),
		t("} "),
		i(2, "[name]"),
		t(": "),
		i(0),
	}),

	s({
		trig = "@return",
		name = "doc string return",
	}, {
		t("-- @return {"),
		i(1, "[type]"),
		t("} "),
		i(2, "[name]"),
		t(": "),
		i(0),
	}),
}
