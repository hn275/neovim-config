vim.g.oceanic_material_transparent_background = 0
vim.g.oceanic_material_background = "darker" -- ocean, medium, deep, darker
vim.g.oceanic_material_allow_bold = 1
vim.g.oceanic_material_allow_italic = 1
vim.g.oceanic_material_allow_underline = 1
vim.g.oceanic_material_allow_undercurl = 1
vim.g.oceanic_material_allow_underculr = 1
vim.cmd.colorscheme("oceanic_material")

local setlualine = require("themes.util.setlualine")
setlualine("jellybeans")
