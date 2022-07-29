local options = {
  UltiSnipsExpandTrigger = "<tab>",
  UltiSnipsJumpForwardTrigger = "<a-j>",
  UltiSnipsJumpBackwardTrigger = "<a-k>",
  UltiSnipsSnippetDirectories = {"UltiSnips", "custom_snippets"},
}

for key, value in pairs(options) do
  vim.api.nvim_set_var(key, value)
end
