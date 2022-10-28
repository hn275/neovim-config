vim.cmd([[
let g:vimtex_compiler_method = "latexmk"
]])

if vim.fn.has("linux") == 1 then
	vim.cmd([[let g:vimtex_view_method = "zathura"]])
elseif vim.fn.has("mac") == 1 then
	vim.cmd([[let g:vimtex_view_method = "skim"]])
end
