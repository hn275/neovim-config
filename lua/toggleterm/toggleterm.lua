local term_ok, term = pcall(require, "toggleterm")

if not term_ok then
	print("not loaded: toggleterm")
	return
end

term.setup({
	open_mapping = [[<C-t>]],
	start_in_insert = false,
	shade_terminals = false,
	insert_mappings = false,
})
