local autopair_ok, autopair = pcall(require, "nvim-autopairs")

if not autopair_ok then
	return
end

autopair.setup()
