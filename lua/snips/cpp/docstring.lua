-- snips/cpp/docstring.lua
local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function get_return_type(type)
	if type[1][1] == "[return type]" then
		return ""
	end
	return type[1][1] .. " "
end

local function get_function_name(name)
	local n = name[1][1]
	if n ~= "[function name]" then
		return n
	end
	return ""
end

local function get_params(p)
	return "(" .. p[1][1] .. ")"
end

-- TODO: add @param type doc string
local M = {}

M.functions = {
	t("/* "),
	f(get_return_type, { 1 }),
	f(get_function_name, { 2 }),
	f(get_params, { 3 }),
	t({ "", "" }),
	t({ " */", "" }),
	i(1, "[return type]"),
	t(" "),
	i(2, "[function name]"),
	t("("),
	i(3), -- params
	t({ ") {", "\t" }),
	i(0),
	t({ "", "}" }),
}

return M
