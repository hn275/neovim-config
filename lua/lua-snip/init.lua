local status, lua_snip = pcall(require, "luasnip")
if not status then
	return
end

lua_snip.filetype_extend("javascript", { "javascriptreact" })
lua_snip.filetype_extend("typescript", { "typescriptreact" })
