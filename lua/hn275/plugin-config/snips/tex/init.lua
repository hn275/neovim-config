local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local file_name = vim.fn.expand("%:t:r")

return {
	s({
		trig = "!",
		name = "boilerplate for a LaTeX file",
	}, {
		t({
			"\\documentclass{article}",
			"\\usepackage{}",
			"\\begin{document}",
			"",
			"",
		}),
		i(0),
		t({ "", "", "\\end{document}" }),
	}),

	s({
		trig = "meta",
		name = "meta data",
	}, {
		t("\\title{"),
		t(file_name),
		t({ "}", "\\author{" }),
		i(1),
		t({ "}", "\\date{\\today}", "", "\\maketitle", "", "" }),
	}),

	s({
		trig = "sec*",
		name = "un-numbered section tag",
	}, {
		t("\\section*{"),
		i(1),
		t({ "}", "" }),
	}),

	s({
		trig = "subsec*",
		name = "un-numbered sub-section tag",
	}, {
		t("\\subsection*{"),
		i(1),
		t({ "}", "" }),
	}),

	s({
		trig = "subsubsec*",
		name = "un-numbered sub-section tag",
	}, {
		t("\\subsubsection*{"),
		i(1),
		t({ "}", "" }),
	}),

	s({
		trig = "p",
		name = "paragraph tags",
	}, {
		t("\\paragraph{"),
		i(1),
		t({ "}", "" }),
	}),

	s({
		trig = "bf",
		name = "bold text",
	}, {
		t("\\textbf{"),
		i(1),
		t("}"),
		i(0),
	}),

	s({
		trig = "it",
		name = "italicize text",
	}, {
		t("\\textit{"),
		i(1),
		t("}"),
		i(0),
	}),

	s({
		trig = "under",
		name = "underline text",
	}, {
		t("\\underline{"),
		i(1),
		t("}"),
		i(0),
	}),

	s({
		trig = "begin",
		name = "begin-end section tags",
	}, {
		t("\\begin{"),
		i(1),
		t({ "}", "", "" }),
		i(0),
		t({ "", "", "\\end{" }),
		i(1),
		t("}"),
	}),

	s({
		trig = "fr",
		name = "fracion tag",
	}, {
		t("\\frac{"),
		i(1),
		t({ "}{" }),
		i(2),
		t("}"),
		i(0),
	}),
}
