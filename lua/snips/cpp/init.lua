local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s({
		trig = "include",
		name = "Include statement",
	}, {
		t("#include <"),
		i(1),
		t({ ">", "" }),
	}),

	s({
		trig = "string",
		name = "std::string uniform initialization",
	}, {
		t("std::string "),
		i(1),
		t(' {"'),
		i(2),
		t({ '"};', "" }),
	}),

	s({
		trig = "vector",
		name = "std::vector uniform initialization",
	}, {
		t("std::vector<"),
		i(1),
		t("> "),
		i(2),
		t(" {"),
		i(3),
		t({ "};", "" }),
	}),
}
