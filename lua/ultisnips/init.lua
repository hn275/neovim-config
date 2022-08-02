local options = {
  UltiSnipsSnippetDirectories = { "custom_snippets" }, -- im only using my own snippet, list "UltiSnips" in the table if including snippets from UltiSnips
}

for key, value in pairs(options) do
  vim.api.nvim_set_var(key, value)
end
