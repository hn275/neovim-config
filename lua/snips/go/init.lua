local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node

local snip_func = require("snips.go.functions")

return {
	s("err", {
		t({ "err != nil {", "\t" }),
		i(0),
		t({ "", "}", "" }),
	}),

	s(
		"func",
		c(1, {
			d(nil, snip_func.goroutines),
			d(nil, snip_func.anonymous),
			d(nil, snip_func.regular),
			d(nil, snip_func.methods),
		})
	),

	s("bson", {
		t('bson:"'),
		i(1),
		t('"'),
	}),

	s("json", {
		t('json:"'),
		i(1),
		t('"'),
	}),

	s("binding", {
		t('binding:"'),
		i(1),
		t('"'),
	}),
}
