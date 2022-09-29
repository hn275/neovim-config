local ls = require("luasnip")
local snippet = ls.snippet
local snipptNode = ls.snippet_node
local indentSnippetNode = ls.indent_snippet_node
local textNode = ls.text_node
local insertNode = ls.insert_node
local functionNode = ls.function_node

ls.add_snippets(
	"javascript",
	snippet("ternary", {
		insertNode(1, "cond"),
		textNode("?"),
		insertNode(2, "then"),
		textNode(":"),
		insertNode(3, "else"),
		textNode(";"),
	})
)
