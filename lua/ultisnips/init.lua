local options = {
  UltiSnipsExpandTrigger = "<tab>",
  UltiSnipsJumpForwardTrigger = "<tab>",
  UltiSnipsJumpBackwardTrigger = "<c-z>",
  UltiSnipsSnippetDirectories = {"UltiSnips", "custom_snippets"},
}

for key, value in pairs(options) do
  vim.api.nvim_set_var(key, value)
end
