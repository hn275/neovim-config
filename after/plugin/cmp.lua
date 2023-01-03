local cmp_status_ok, cmp = pcall(require, "cmp")
local luasnip_ok, luasnip = pcall(require, "luasnip")

if not cmp_status_ok or not luasnip_ok then
	vim.cmd.PackerSync()
	print("Restart nvim to apply changes.")
end

local mapping = require("hn275.plugin-config.cmp.mapping") -- mapping

cmp.setup({
	-- enabled = function() -- disable cmp in when commenting
	-- 	local context = require("cmp.config.context")
	-- 	if vim.api.nvim_get_mode().mode == "c" then
	-- 		return true
	-- 	else -- return false if cursor is in a comment group
	-- 		return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
	-- 	end
	-- end,
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(), -- completion border
		documentation = cmp.config.window.bordered(), -- documentation border
	},
	mapping = mapping,
	matching = {
		disallow_fuzzy_matching = false, -- allow fuzzy matching
		disallow_partial_matching = false, -- allow partial matching
	},
	formatting = {
		fields = { "abbr", "menu" },
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = false,
	},
})

luasnip.filetype_extend("javascript", { "javascriptreact" })
luasnip.filetype_extend("typescript", { "typescriptreact" })
luasnip.config.set_config({
	history = true,
	update_events = "TextChanged,TextChangedI",
})

-- Custom luasnips
require("luasnip.loaders.from_vscode").lazy_load({
	paths = { "./snippets/vscode" },
})
require("hn275.plugin-config.snips") -- loading all custom snippets
