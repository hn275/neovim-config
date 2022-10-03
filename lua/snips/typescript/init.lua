local ls = require("luasnip")
local s = ls.snippet

local useState = require("snips.typescript.utils.useState")
local boilerCode = require("snips.typescript.utils.boilerplate")

return {
	s({
		trig = "tus",
		name = "typescript react useState hook",
	}, useState),

	s({
		trig = "!",
		name = "typescript component boilerplate",
	}, boilerCode),
}
