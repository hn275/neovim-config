local ls = require("luasnip")
local snippet = ls.snippet
local textNode = ls.text_node
local insertNode = ls.insert_node

return {
	snippet({ trig = "console" }, {
		textNode("console.log("),
		insertNode(1, "var"),
		textNode(")"),
	}),
}
