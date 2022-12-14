local ls = require("luasnip")
local fn = ls.function_node
local t = ls.text_node
local i = ls.insert_node

local get_var_name = function(input, _, _)
	local firstToUpper = function(str) -- Capitalizing the first letter
		return (str:gsub("^%l", string.upper))
	end

	local var_name = input[1][1]
	return "set" .. firstToUpper(var_name)
end

return {
	t("const ["),
	i(1),
	t(", "),
	fn(get_var_name, { 1 }, nil),
	t("] = useState("),
	i(2),
	t(");"),
}
