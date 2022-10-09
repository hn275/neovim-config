local ayu_ok, ayu = pcall(require, "ayu")

if not ayu_ok then
	return
end

ayu.setup({
	mirage = true,
})

ayu.colorscheme()
