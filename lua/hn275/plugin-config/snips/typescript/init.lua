local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local hooks = require("hn275.plugin-config.snips.typescript.utils.hooks")
local boilerCode = require("hn275.plugin-config.snips.typescript.utils.boilerplate")

return {
	s({
		trig = "tus",
		name = "typescript react useState hook",
	}, hooks.useState),

	s({
		trig = "tue",
		name = "typescript react useEffect hook",
	}, hooks.useEffect),

	s({
		trig = "!",
		name = "typescript component boilerplate",
	}, boilerCode),

	s({ trig = "try", name = "try.. catch.." }, {
		t({ "try {", "\t" }),
		i(0),
		t({ "", "} catch (e) {", "\t" }),
		i(1),
		t({ "", "}" }),
	}),

	s({ trig = "fetch", name = "fetch function" }, {
		t("fetch("),
		i(1),
		t({ ")", ".then((response) => response.json())", "" }),
		t({ ".then((result) => {", "\t" }),
		i(3),
		t({ "", "})", ".catch((err) => {", "\t" }),
		i(2),
		t({ "", "});", "" }),
	}),

	s({ trig = "import", name = "es6 import syntax" }, {
		c(1, {
			d(nil, function()
				return sn(1, {
					t("import { "),
					i(2, "/* named import */"),
					t(' } from "'),
					i(1),
					t('";'),
				})
			end),

			d(nil, function()
				return sn(1, {
					t("import "),
					i(2, "/* default import */"),
					t(' from "'),
					i(1),
					t('";'),
				})
			end),
		}),
	}),

	s({ trig = "describe", name = "jest describe" }, {
		t('describe("'),
		i(1),
		t({ '", () => {', "" }),
		t({ '\tit("' }),
		i(2),
		t({ '", () => {', "\t" }),
		i(0),
		t({ "", "\t})" }),
		t({ "", "})" }),
	}),

	s({ trig = "it", name = "jest it" }, {
		t('it("'),
		i(1),
		t({ '", () => {', "\t" }),
		i(0),
		t({ "", "})" }),
	}),
}
