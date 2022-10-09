local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local file_name = vim.fn.expand("%")
local today = os.date("%x")

return {
	s({
		trig = "!",
		name = "cpp main function boiler plate",
	}, {
		t({ "/* " .. file_name, "\t" }),
		i(1),
		t({ "", "\tHal N - " .. today, "*/", "", "" }),
		t({ "int main() {", "\t" }),
		i(0),
		t({ "", "\treturn 0;", "}" }),
	}),

	s({
		trig = "include",
		name = "Include statement",
	}, {
		t("#include <"),
		i(1),
		t({ ">", "" }),
	}),

	s({
		trig = "str",
		name = "std::string",
	}, {
		t("std::string"),
	}),

	s({
		trig = "cout",
		name = "std::cout",
	}, {
		t("std::cout << "),
		i(0),
	}),

	s({
		trig = "end",
		name = "std::endl;",
	}, {
		t({ "std::endl;", "" }),
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

	s({
		trig = "//",
		name = "C++ style comments",
	}, {
		t("/* "),
		i(1),
		t(" */"),
		i(0),
	}),

	s({
		trig = "for",
		name = "C++ for loop",
	}, {
		t("for ("),
		i(1),
		t({ ") {", "\t" }),
		i(2),
		t({ "", "}" }),
	}),

	s({
		trig = "if",
		name = "C++ if statement",
	}, {
		t("if ("),
		i(1),
		t({ ") {", "\t" }),
		i(2),
		t({ "", "}" }),
	}),
}
