-- no need to do protected call here since
-- cmp.lua is already quitting on failure
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok or cmp == nil then
	return
end
local luasnip = require("luasnip")

-- check back space
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local M = {

	["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),

	["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

	["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` to remove the default `<C-y>` mapping.

	["<C-z>"] = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	}),

	["<TAB>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.confirm({ select = true })
		elseif check_backspace() then
			fallback()
		end
	end, { "i", "s" }),

	["jk"] = cmp.mapping(function(fallback)
		if luasnip.jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end, { "i" }),

	["jj"] = cmp.mapping(function(fallback)
		if luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i" }),

	["<C-n>"] = cmp.mapping(function(callback)
		if cmp.visible() then
			cmp.select_next_item()
		else
			callback()
		end
	end, { "i" }),

	["<C-j>"] = cmp.mapping(function(callback)
		if luasnip.choice_active() then
			luasnip.change_choice(1)
		else
			callback()
		end
	end, { "i" }),

	["<C-p>"] = cmp.mapping(function(callback)
		if cmp.visible() then
			cmp.select_prev_item()
		else
			callback()
		end
	end, { "i" }),

	["<C-k>"] = cmp.mapping(function(callback)
		if luasnip.choice_active() then
			luasnip.change_choice(-1)
		else
			callback()
		end
	end, { "i" }),
}

return M
