local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node
local fn = ls.function_node

local component = function(input)
	return input[1][1]
end

return {
	t({ "import React from 'react';", "", "" }),
	t("interface "),
	i(1),
	t({ "PropTypes {", "\t" }),
	i(2),
	t({ "", "}", "", "", "export const " }),
	fn(component, { 1 }, nil),
	t({ " = ({" }),
	i(3),
	t("}: "),
	fn(component, { 1 }, nil),
	t({ "PropTypes) => {", "\treturn" }),
	i(0),
	t({ "", "}" }),
}
