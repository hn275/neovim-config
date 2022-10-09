local ayu_ok, ayu = pcall(require, "ayu")
local setlualine = require("themes.util.setlualine")

if not ayu_ok then
	return
end

ayu.setup({
	mirage = true,
})

ayu.colorscheme()
