local has_mac = vim.fn.has("macunix")

local font_name = "JetBrainsMono Nerd Font"
if has_mac == 1 then
	font_name = font_name .. ":h15"
else
	font_name = font_name .. ":h10.5"
end

vim.opt.guifont = font_name
