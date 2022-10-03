local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
	s({
		trig = "!main",
		name = "boilerplate for a main Go file",
	}, {
		t({ "package main", "", "" }),
		t({ "import ", "", "" }),
		t({ "func main() {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
	s({
		trig = "!",
		name = "boilerplate for a new go file",
	}, {
		t("func "),
		i(1),
		t({ "() {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
}
