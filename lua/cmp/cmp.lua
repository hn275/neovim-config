local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local mapping = require("cmp.mapping") -- mapping
local formatting = require("cmp.formatting") -- formatting

cmp.setup({
	enabled = function() -- disable cmp in when commenting
		local context = require("cmp.config.context")
		if vim.api.nvim_get_mode().mode == "c" then
			return true
		else -- return false if cursor is in a comment group
			return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
		end
	end,
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
	formatting = formatting,
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
		ghost_text = true,
	},
})

-- Custom luasnips
require("luasnip.loaders.from_vscode").lazy_load({
	paths = { "./snippets" },
})
