local has_neovide = vim.fn.exists("neovide")

if has_neovide ~= 1 then
	return
end

local neovide_opt = {
	neovide_transparency = 0.95,
	neovide_confirm_quit = true,
	neovide_remember_window_size = true,
	neovide_hide_mouse_when_typing = true,
}
for key, val in pairs(neovide_opt) do
	vim.api.nvim_set_var(key, val)
end
