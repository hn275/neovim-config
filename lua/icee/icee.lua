local icee_ok, icee = pcall(require, "icee")

if not icee_ok then
	return
end

local k = require("util.keymap").keymap

icee.setup()

k("n", "<leader>g", "<CMD>IceeLsp<CR>")
