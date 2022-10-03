local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s({
		trig = "bf",
		name = "bold",
	}, {
		t("*"),
		i(1),
		t("*"),
	}),

	s({
		trig = "it",
		name = "italicize",
	}, {
		t("/"),
		i(1),
		t("/"),
	}),

	s({
		trig = "underline",
		name = "underline",
	}, {
		t("_"),
		i(1),
		t("_"),
	}),

	s({
		trig = "code",
		name = "code block",
	}, {
		t("@code "),
		i(1),
		t({ "", "", "" }),
		i(2),
		t({ "", "", "@end", "", "" }),
		i(0),
	}),
}
