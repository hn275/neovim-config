local onenord_ok, onenord = pcall(require, "onenord")

if not onenord_ok then
	return
end

onenord.setup()

local setlualine = require("themes.util.setlualine")

setlualine("onenord")
