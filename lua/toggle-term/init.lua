local toggletermStatus, toggleterm = pcall(require, "toggleterm")
if not toggletermStatus then
	print("!Toggle Term failed")
	return
end

toggleterm.setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 10
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<c-\>]],
	shade_terminals = false,
	-- shade_factor = 1, -- only for shade_terminals = true
	start_in_insert = false,
	direction = "float", -- "horizontal" | "veritcal" | "float"
	hide_numbers = true,
	close_on_exit = true,
	float_opts = { -- only for floating terminal
		border = "single",
	},
})

local opt = { noremap = true, silent = true }
local toggleTermMap = {
	["<esc>"] = "<C-\\><C-n>",
	["<C-h>"] = "<C-\\><C-n>:wincmd h<CR>",
	["<C-j>"] = "<C-\\><C-n>:wincmd j<CR>",
	["<C-k>"] = "<C-\\><C-n>:wincmd k<CR>",
	["<C-l>"] = "<C-\\><C-n>:wincmd l<CR>",
}

for key, val in pairs(toggleTermMap) do
	vim.api.nvim_set_keymap("t", key, val, opt)
end
