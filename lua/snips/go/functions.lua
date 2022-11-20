local ls = require("luasnip")
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node

local M = {}

M.goroutines = function()
	return sn(1, {
		t("go func ("),
		i(1),
		t({ ") {", "\t" }),
		i(3, "// goroutine"),
		t({ "", "}(" }),
		i(2),
		t({ ")", "" }),
	})
end

M.regular = function()
	return sn(1, {
		t("func "),
		i(1),
		t({ " (" }),
		i(2),
		t({ ") " }),
		i(3),
		t({ " {", "\t" }),
		i(4, "// regular function"),
		t({ "", "}", "" }),
	})
end

M.anonymous = function()
	return sn(1, {
		t("func ("),
		i(1),
		t({ ") " }),
		i(2),
		t({ " {", "\t" }),
		i(4, "// anonymous function"),
		t({ "", "}(" }),
		i(3),
		t({ ")", "" }),
	})
end

M.methods = function()
	return sn(1, {
		t("func ("),
		i(1),
		t(") "),
		i(2),
		t("("),
		i(3),
		t(") "),
		i(4),
		t({ " {", "\t" }),
		i(5, "// struct method"),
		t({ "", "}", "" }),
	})
end

return M
