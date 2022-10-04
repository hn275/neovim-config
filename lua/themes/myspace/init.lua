local opts = {
	myspace_italicize = true,
}

for key, value in pairs(opts) do
	vim.api.nvim_set_var(key, value)
end

vim.cmd([[colorscheme myspace]])

local setlualine = require("themes.util.setlualine")

setlualine("material")
