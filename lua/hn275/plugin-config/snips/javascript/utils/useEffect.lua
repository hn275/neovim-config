local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node

return {
	t({ "useEffect(() => {" }),
	t({ "", "\t" }),
	i(1),
	t({ "", "}, [" }),
	i(2),
	t("])"),
}
