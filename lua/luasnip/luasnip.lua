local status, ls = pcall(require, "luasnip")
if not status then
	return
end

ls.filetype_extend("javascript", { "javascriptreact" })
ls.filetype_extend("typescript", { "typescriptreact" })
