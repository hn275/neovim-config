local status, catppuccin = pcall(require, "catppuccin")
if not status then return end

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

catppuccin.setup({
  dim_inactive= {
    enabled = true,
    shade = "dark",
    percentage = 0.3,
  },
  integrations = {
    lsp_trouble = true,
    cmp = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
  }
})


vim.cmd[[ colorscheme catppuccin ]]
