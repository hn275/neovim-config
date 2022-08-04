-- no need to do protected call here since
-- cmp.lua is already quitting on failure
local cmp = require("cmp")

-- check back space
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

local M = {
	["<C-k>"] = cmp.mapping.select_prev_item(), -- next item
	["<C-j>"] = cmp.mapping.select_next_item(), -- previous item
	["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
	["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
	["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` to remove the default `<C-y>` mapping.
	["<C-z>"] = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	}),
	["<CR>"] = cmp.mapping.confirm({ select = false }), -- only select the hovering autocomplete
	["<tab>"] = cmp.mapping(function(fallback)
		if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then -- jump forward if possible
			vim.fn["UltiSnips#JumpForwards"]()
		elseif cmp.visible() then
			cmp.confirm({ select = true })
		elseif check_backspace() then
			fallback()
		end
	end, { "i", "s" }),
	["<S-tab>"] = cmp.mapping(function(fallback)
		if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
			vim.fn["UltiSnips#JumpBackwards"]()
		elseif cmp.visible() then
			cmp.select_prev_item()
		else
			fallback()
		end
	end, { "i", "s" }),
}

return M
