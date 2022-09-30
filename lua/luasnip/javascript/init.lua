local ls = require("luasnip")
local s = ls.snippet
local useState = require("luasnip.javascript.utils.useState")
local useEffect = require("luasnip.javascript.utils.useEffect")
local docstring = require("luasnip.javascript.utils.docstring")

return {
	s({
		trig = "us",
		name = "React hook: useState",
	}, useState),
	s({
		trig = "ue",
		name = "React hook: useEffect",
	}, useEffect),
	docstring.doc,
	docstring.params,
}
