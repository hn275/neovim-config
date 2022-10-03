local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node

local file_name = vim.fn.expand("%:t:r")
local file_name_type = file_name .. "Type"

return {
	t({ "import React from 'react';", "", "" }),
	t({ "interface " .. file_name_type .. " {", "\t" }),
	i(1),
	t({ "", "}", "", "" }),
	t({ "export const " .. file_name .. ": React.FC<" .. file_name_type .. "> = () => {", "", "\t" }),
	i(2),
	t({ "", "\treturn(<div>" .. file_name .. "</div>);", "}" }),
}
